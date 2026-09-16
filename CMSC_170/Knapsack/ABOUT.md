# Knapsack — Change Log & Analysis

This document records the full analysis of the **Knapsack** folder and every change made
to it, in the order the work happened. The folder holds two independent Java solutions to
the knapsack problem plus some reference text dumps.

Environment used for analysis: `javac`/`java` **21.0.12**.

---

## 1. Starting point

| File | Role |
|------|------|
| `Knapsack.java` | Swing GUI + **depth-first branch-and-bound** solver for **0/1 knapsack** (package `knapsack`). Reads items from a file, sorts by profit/weight density, explores the state-space tree, writes `result.txt` (visited nodes) and `solution.txt`. Author: Odarve / Tabilla. |
| `ZeroOneKnapsack.java` | Standalone **dynamic-programming** 0/1 knapsack (value table + item reconstruction), with a `main` demo. |
| `Knapsack.txt`, `KnapSack_Back.txt`, `KnapsackBacktrack.java.txt`, `KnapsackBandB.java.txt` | Reference text dumps — **not** compilable source, left untouched. |
| `Odarve_Tabilla_Knapsack.rar` | Original archive — left untouched. |

Both `.java` files were compiled and driven with test harnesses to observe real behavior
before any change was made. `Knapsack.java` compiled with only deprecation warnings;
`ZeroOneKnapsack.java` compiled clean. **No compile errors** were present — every defect
found was a **logic / runtime error**.

---

## 2. Findings and fixes

Each item lists the root cause, the reproduction, and the fix. All fixes preserve the
original **algorithm** and, for `Knapsack.java`, its original `(level,position)`
visited-node output — only the buggy mechanics were corrected. No rewrite was done.

### [L1] `ZeroOneKnapsack.java` — item reconstruction reported the wrong items

- **Root cause.** The DP value table was computed correctly, but the code that recovers
  *which* items were taken read `taken[i+1][maxWeightAllowed]` for every row using the
  **full** weight column, plus an ad-hoc mutation (`if(!taken[i-1][w-weight]) taken[i-1][w]=false;`)
  that tried to patch it one row at a time. Correct 0/1 backtracking must start at
  `w = maxWeightAllowed` and **decrement** `w` by an item's weight each time that item is
  taken.
- **Reproduction.** Items A(w5,p1), B(w1,p10), C(w1,p10), capacity 2 → optimum is
  **B + C (profit 20)**, but the code reported only **C (profit 10)**.
- **Fix.** Removed the mutation hack and replaced the reconstruction loop with proper
  backtracking:
  ```java
  int w = maxWeightAllowed;
  for(int i=this.items.length; i>=1; i--){
      if(values[i][w] != values[i-1][w]){ ret[i-1] = true; w -= this.items[i-1].weight; }
  }
  ```
  The crafted case now reports B + C = 20.

### [L2] `Knapsack.java` — solution output wiped itself

- **Root cause.** In the base case, the loop that prints the selected items did
  `if(nclude[i] == 1) textSolution.setText(" ");` — blanking the whole text area whenever
  an included item was found — and then **appended every item unconditionally**. The
  displayed/saved solution was therefore garbage and never actually listed only the chosen
  items.
- **Fix.** Print only included items and never clear mid-loop:
  ```java
  for(i=0; i<size; i++){
      if(nclude[i] == 1)
          textSolution.append("Item " + (i+1) + "<" + p[i] + "," + w[i] + ">" + "\n");
  }
  ```

### [L3] `Knapsack.java` — integer division destroyed the density (sort + bound)

- **Root cause.** Item density was computed as `z[i] = x[i]/y[i]` with **`int`**
  arithmetic. Truncation made distinct densities compare equal (e.g. 3/2 and 4/3 both → 1),
  corrupting both the descending sort **and** the fractional bound
  `temp_profit + (capacity-weight)*pw[k]` that drives pruning. Because the bound could be
  under-estimated, a branch containing the optimum could be pruned. A zero-weight item also
  threw `ArithmeticException`.
- **Fix.** Compute density in floating point (with a zero-weight guard) and thread
  `double[]` through the pipeline:
  - `z` is now `double[]`; `z[i] = (y[i]==0) ? Double.MAX_VALUE : (double)x[i]/y[i];`
  - the density swap in the sort uses a `double` temp;
  - the `pw` parameter of `dfs`, `get_bound`, `go_left`, and `get_items` is now `double[]`;
  - the final bound is floored back to `int` (`(int)(...)`), which keeps it a valid upper
    bound while leaving the rest of the integer bookkeeping unchanged.

### [L4] `Knapsack.java` — DFS backtracking counter was never reset  *(Option 1)*

- **Root cause.** When backtracking from an even (right-child) node, `dfs` searches for the
  correct ancestor level using a parity count. `temp_count` was initialized once and then
  **accumulated across every `k` iteration and every outer iteration**, so the
  `temp_count % 2 == 1` test that decides which level to back up to was computed on a
  corrupted running total.
- **Fix.** Reset `temp_count = 0;` at the start of each `k` iteration so each level's count
  is fresh.

### [L5] `Knapsack.java` — exhausted backtrack search fell through  *(Option 1)*

- **Root cause.** If the ancestor search finished without finding a target (`trigger`
  stayed `false`), `last_lev` / `last_pos` were left unchanged; the code then re-appended
  the **same** node and, on the next promising check, descended past the last item →
  `ArrayIndexOutOfBoundsException`.
- **Fix.** Treat "no ancestor left" as termination and skip the node append when finished:
  ```java
  if(trigger == false){ stop = true; }   // traversal exhausted
  ...
  if(stop == false){ lev.addElement(last_lev); pos.addElement(last_pos); exclude(); get_bound(...); }
  ```

### [L6] `Knapsack.java` — no leaf guard before descending  *(Option 1b)*

- **Root cause.** The expansion branch `if(if_promising()) go_left(...)` had no check that
  the current node was already at the **last item**. When a node at `last_lev == size` was
  deemed promising, `go_left` created a non-existent level `size+1` and indexed
  `p[last_lev-1]` out of bounds. (Instances where every last-level leaf happened to be
  non-promising — e.g. the textbook demo — avoided this by luck.)
- **Reproduction (delta-reduced).** cap 17, items (40,1)(57,5)(65,19)(62,17) → crash.
- **Fix.** Only descend when not already at the last level; `if_promising()` is kept on the
  left of `&&` so its side effect (recording the leaf's profit into `max_profit`) still
  runs, and promising leaves fall through to the same backtrack path that already handles
  non-promising leaves:
  ```java
  if(if_promising() == true && last_lev < size){ go_left(p, w, pw); }
  ```

### [L7] `Knapsack.java` — stray leading space on file re-load

- **Root cause.** Re-reading a file cleared the input box with `inputTBox.setText(" ")`
  (a space) instead of `""`, leaving a stray leading space in the display. Purely a GUI
  nit — it never reaches the solver, which re-parses the file itself.
- **Fix.** `inputTBox.setText("");`

---

## 3. Why targeted fixes rather than a rewrite

`Knapsack.java` already implements the intended algorithm — depth-first branch-and-bound
with a greedy density upper bound. A recursive rewrite would be the *same algorithm* with
simpler mechanics, but it would change the author's structure and the exact
`(level,position)` visited-node numbering shown in the GUI and written to `result.txt`.
To keep the original design and output intact, the bugs [L4]–[L6] were fixed in place
(the parallel-`Vector` navigation was corrected, not replaced).

---

## 4. Verification

A differential harness generated random instances and compared the solver's max profit
against a brute-force (2ⁿ subset) optimum, also flagging any crash.

| Stage | Result |
|-------|--------|
| Before any DFS fix | ~17.6 % of random instances **crashed** |
| After [L4]+[L5] (Option 1) | crash rate ~0.9 %, **0 wrong answers** |
| After [L6] (Option 1b) | **0 crashes, 0 wrong answers** |

Coverage after all fixes:

- 70,000 mixed random instances (multiple seeds) + explicit edge cases (single item, item
  too heavy, all fit, none fit, duplicate densities, identical items, capacity 1) + large-n
  (8–12 items) — **0 wrong, 0 crash**.
- **1,000,000** random instances (2–7 items, run 8-wide across the 8 available cores,
  ~21 min wall time) — **1,000,000 correct, 0 wrong, 0 crash.**

Memory stayed flat throughout (each instance allocates only small, immediately
garbage-collected arrays); the run is CPU/time-bound, not memory-bound.

---

## 5. Deliberately left unchanged

- **`new Integer(int)` deprecation warnings** (lines ~206, 213, 393, 625). Deprecated /
  marked-for-removal since Java 9, but behaviorally identical to `Integer.valueOf(int)`.
  An era artifact, not an algorithmic issue — left as period-authentic per request.
- **Unused-local warnings** (`index`, `position`). Dead locals with no effect on behavior.
- **The `.txt` reference dumps and the `.rar` archive.** Not compilable source.
