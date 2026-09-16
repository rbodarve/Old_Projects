# Tic-Tac-Toe — Change Log & Analysis

This document records the full analysis of the **TicTacToe** folder and every change made
to it, in the order the work happened. The folder holds a Swing-based Tic-Tac-Toe game
whose computer opponent uses the classic Newell & Simon heuristic strategy (win → block →
fork → block-fork → center → opposite corner → empty corner → empty side).

Environment used for analysis: `javac`/`java` **21.0.12**.

---

## 1. Starting point

| File | Role |
|------|------|
| `TicTacToeAI.java` | The game/AI engine: 3×3 board, win detection (`isWin`), immediate-win search (`nextWinningMove`), fork detection (`isFork`), and the heuristic move chooser (`nextMove`). Authors: Odarve / Palmares (Lab Exercise 2, 2012). |
| `TicTacToeMain.java` | Swing GUI (`JFrame` + 3×3 `JButton` grid), Play flow, icon/turn dialogs, and the human ↔ computer turn loop. |

The project **compiled** at the start (`javac 21`, exit 0) — but that clean compile was
itself *hiding* the most serious defect (see [C1]). Every issue found was either a
structural defect or a **logic error**; there were no outright syntax errors.

---

## 2. Findings and fixes

Three defects were fixed, in priority order. Two additional quality issues were reviewed
and deliberately left unchanged (see §4).

### [C1] `TicTacToeMain.java` — the entire `TicTacToeAI` class was duplicated inside it

- **Root cause.** A full second copy of the `TicTacToeAI` class had been pasted into
  `TicTacToeMain.java` (after the `play()` method, still inside the outer class braces).
  Java silently accepted it as a **non-static inner class**, emitting
  `TicTacToeMain$TicTacToeAI.class` alongside `TicTacToeAI.class`. Because an inner class of
  the same simple name takes precedence, **every** reference inside `TicTacToeMain`
  (`new TicTacToeAI()`, `TicTacToeAI.EMPTY`, `.ONE`, `.TWO`) bound to the *pasted inner
  copy* — making the standalone `TicTacToeAI.java` **dead code**. Any future bug fix applied
  to `TicTacToeAI.java` would have had no effect at runtime: a silent maintenance trap.
- **Why it compiled.** `EMPTY`/`ONE`/`TWO` are `static final` compile-time constants, which
  are the one kind of static member a non-static inner class is allowed to declare, so
  nothing complained.
- **Fix.** Removed the duplicated class body so `TicTacToeMain.java` ends after `play()`.
  Recompiling now emits only `TicTacToeAI.class` and `TicTacToeMain.class` — confirming the
  standalone engine is the one actually used.

### [L1] `TicTacToeAI.java` — "play empty corner" checked only **one random** corner

- **Root cause.** The empty-corner rule picked a single random corner and gave up if it was
  taken, instead of scanning all four:
  ```java
  int corner[] = {0,2};
  int temp  = new java.util.Random().nextInt(2);   // 0 or 1
  int temp2 = new java.util.Random().nextInt(2);   // 0 or 1
  if (getBoardValue(corner[temp], corner[temp2]) == EMPTY) { ... return ...; }
  ```
  If the randomly chosen corner was occupied, control fell through to "play empty side",
  so the AI could pass up an available corner and take a strategically weaker edge.
- **Fix.** Deterministically scan all four corners and return the first empty one:
  ```java
  int corner[] = {0,2};
  for (int c1 = 0; c1 < 2; c1++)
      for (int c2 = 0; c2 < 2; c2++)
          if (getBoardValue(corner[c1], corner[c2]) == EMPTY)
              return new int[]{corner[c1], corner[c2]};
  ```
  Side benefit: removing the `Random` calls made `nextMove` **fully deterministic**, which
  is what later made an exhaustive game-tree check possible (see §3).

### [L2] `TicTacToeAI.java` — `isFork` had a spurious second condition that broke both fork rules

- **Root cause.** `isFork` is meant to answer one question: *"is there an empty square where
  `inverse(token)` could create a fork (two simultaneous winning threats)?"* The original
  code correctly counted those threats, but then added a second inner loop that **also**
  required placing the *other* player's token on that square to produce a winning threat,
  and only then returned it:
  ```java
  if (count == 2) {
      board[i][j] = token;                 // wrong player
      // ... only return (i,j) if THIS token also gets a win threat ...
  }
  ```
  This extra requirement corrupted **both** callers:
  - **Offense** — `isFork(inverse(token))` (create own fork): a genuine fork square was
    discarded unless the *opponent* also had a threat there.
  - **Defense** — `isFork(token)` (block opponent's fork): a real fork threat went
    unblocked unless the computer *also* gained a threat on that exact square.
  It also used `count == 2`, which would miss a fork that produced **three** threats
  (possible from a corner/center, which lie on 3–4 lines).
- **Fix.** Reduced `isFork` to its actual purpose — return the first square where
  `inverse(token)` gets **two or more** winning threats — and moved `count` inside the loop
  so it resets per candidate square:
  ```java
  public int[] isFork(int token) {
      for (int i = 0; i < 3; i++)
          for (int j = 0; j < 3; j++)
              if (getBoardValue(i, j) == EMPTY) {
                  board[i][j] = inverse(token);
                  int count = 0;
                  for (int a = 0; a < 3; a++)
                      for (int b = 0; b < 3; b++)
                          if (getBoardValue(a, b) == EMPTY) {
                              board[a][b] = inverse(token);
                              if (isWin(inverse(token))) count++;
                              board[a][b] = EMPTY;
                          }
                  board[i][j] = EMPTY;
                  if (count >= 2) return new int[]{i, j};
              }
      return null;
  }
  ```
  With this definition the existing call sites are correct: `isFork(inverse(token))` finds a
  square where the computer forks, `isFork(token)` finds a square where the human forks (to
  be occupied as a block), and the double-opposite-corner special case that answers a fork
  with an edge move (`{0,1}`) is preserved.

---

## 3. Verification — exhaustive brute-force simulation

Because [L1] made `nextMove` deterministic, the whole reachable game tree is finite and can
be searched exhaustively. A throwaway harness (`Simulate.java`, since removed) drove the
**real** `TicTacToeAI` class — not a reimplementation — with the AI always playing as the
computer and the adversary exploring **every** legal reply at every turn. It checked two
invariants a correct Tic-Tac-Toe player must satisfy:

1. every move `nextMove` returns is **legal** (in range and on an empty cell), and
2. the AI **never loses** (wins or draws only).

To avoid the leftover debug prints flooding output, `System.out` was redirected to a null
stream during the search and restored for the summary.

| Scenario | Leaves | AI wins | Draws | Losses | Illegal |
|----------|-------:|--------:|------:|-------:|--------:|
| A) Computer first (nextMove-driven)            | 140 | 124 |  16 | **0** | **0** |
| B) Human first (all opponent lines)            | 457 | 326 | 131 | **0** | **0** |
| C) Computer first, forced open cell (mirrors Main's random opening) | 961 | 834 | 127 | **0** | **0** |

Scenario **C** matters most for the shipped game: `TicTacToeMain.play()` opens with a
*random* first move when the computer goes first, so C exercises all nine possible openings
followed by heuristic play. Two concerns raised during code review —

- the fork-block special case returns `{0,1}` **without** re-checking that the cell is
  empty (a potential overwrite), and
- `isFork` returns only the *first* fork square (a possible double-fork blind spot)

— were both proven **unreachable**: they never produce an illegal move or a loss in any
line of play. **Conclusion: no game-logic errors; the AI plays optimally (never loses).**

---

## 4. Deliberately left unchanged

- **Leftover debug output.** `System.out.println("qwe"/"asd"/…)` scattered through
  `nextMove`, plus the coordinate print in `computerTurn`. Console noise only — they never
  read or alter game state and never reach the Swing GUI. Not a compile, logic, or UI
  defect; left as an era artifact.
- **`checkState()` draw detection.** It tests for a draw with two full `nextMove()` calls
  (`nextMove(human) == null && nextMove(computer) == null`) instead of a simple empty-cell
  scan, and its win checks don't `return` early. This is **inefficient**, not wrong:
  `nextMove` returns `null` only on a full board, a draw is only possible on a full board,
  and even when the ninth move both fills the board and wins, the later `isWin` branch
  overwrites the status text so the correct outcome is shown. Correctness is unaffected, so
  it was left in place per surgical-change scope.

---

## 5. Why targeted fixes rather than a rewrite

`TicTacToeAI` already implements the intended Newell & Simon strategy and, once [C1]–[L2]
were corrected, the brute-force check proved it optimal. A minimax rewrite would be the
*same result* with different code; the author's structure, method names, and the GUI flow
were kept intact and only the three defects were repaired.
