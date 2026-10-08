# The N-Queens / Eight Queens Problem

Place N queens on an N×N chessboard so that none attack another (no two share a
row, column, or diagonal).

## Files

| File | Approach |
|------|----------|
| `queens_backtrack.cpp` | Solution #1 — simple backtracking / recursion. Only a 1-D array is used. Economical on memory, but the slowest of the three. |
| `queens2.cpp` | Solution #2 — no recursion; two stacks (arrays) plus Wirth's three boolean arrays to mark attacked squares. |
| `queens_heuristic.cpp` | Solution #3 — recursion with a home-grown column-ordering heuristic; usually finds a solution quickly for large N. |
| `NQueens.java.txt` | Reference Java implementation (rename to `NQueens.java` to compile). |

## Output format

Solutions print as `(Row,Col)` pairs, e.g. `SOLUTION # 1 : (1,1) (2,5) (3,8) ...`
meaning the row-1 queen goes in column 1, the row-2 queen in column 5, and so on.
Rows and columns are numbered 1 - N.

Solutions 2 and 3 use Niklaus Wirth's method of three boolean arrays (one for
columns, two for the diagonal directions) to mark squares already attacked.

## Changes made in this cleanup

These programs were originally written for Turbo C++. They were made to build and
run correctly on a modern compiler (g++ / the VSCode C/C++ extension) while
keeping the original vintage style otherwise intact. All three programs were
verified against the known N-Queens solution counts (N=1→1, N=2→0, N=3→0, N=4→2,
N=6→4, N=8→92, N=10→724).

### Structure
- Split the old combined `queens.cpp` — which held all three programs plus prose
  in one file and therefore could not compile (three `main()`s, duplicate globals,
  text outside comments) — into the three separate files listed above.
- The stack version originally existed twice (inside `queens.cpp` and as
  `queens2.cpp`). The redundant copy was dropped; `queens2.cpp` is now the single
  stack (Solution #2) implementation.
- Moved the original explanatory prose from `queens.cpp` into this `ABOUT.md`.

### Compile fixes (Turbo-C constructs that cannot build on modern compilers)
- `void main()` → `int main()` (with `return 0;`) — required by standard C++.
- Removed `#include <conio.h>` and replaced `getch()` with `getchar()` in
  `queens2.cpp` — `conio.h` is DOS/Turbo-only and has no modern equivalent.
- Commented out the prose/separator text that sat outside comments.

### Logic & robustness fixes
- **`queens_heuristic.cpp` — search never ran:** the local `n1` was declared but
  never assigned (held garbage), so `N` got clobbered and no search happened. Now
  set to `N` right after reading it. Also fixed `printf("N=%d", n1==N)`, which
  printed a comparison result instead of the board size.
- **`queens_heuristic.cpp` — segfault for N=1:** the priority recursion stopped on
  `callCounter != 8*(N/2)-1`, which for N=1 targets `-1` (unreachable → infinite
  recursion → stack overflow). Changed the condition to `callCounter < 8*(N/2)-1`,
  which terminates safely and behaves identically for N ≥ 2.
- **`queens_heuristic.cpp` — type fix:** `leastval` changed from `int` to
  `long int` to match the `long int` priority values it holds (avoids truncation
  at large N). Also removed an unused `ctr1` variable (last compiler warning).
- **`queens_heuristic.cpp` — segfault on Windows (MinGW g++):** the insertion sort
  in `motionorder()` tested `secondOrderPriority[..][motionOrder[..][p-1]]` *before*
  `p-1>=0`, so at `p=0` it read `motionOrder[..][-1]` (heap memory before the array)
  and used it as an index. On Linux/glibc the stray read happened to land in mapped
  memory; on the Windows heap it faults. Swapped the operands so the bounds check
  short-circuits first.
- **Input validation (all three):** sizes `N < 1` are now rejected with a clear
  message and a non-zero exit instead of producing garbage or empty output.
- **Fixed-array bounds (all three):** the vintage fixed marker arrays cap the
  board size, so oversize input is now rejected rather than silently corrupting
  memory — `N ≤ 50` for `queens2.cpp` (`d[100][3]`) and `N ≤ 250` for
  `queens_heuristic.cpp` (`d[500][3]`). `queens_backtrack.cpp` uses no fixed
  marker array and is limited only by available memory.

After these changes all three files compile with `-Wall -Wextra` producing no
errors and no warnings. `NQueens.java.txt` was left untouched as a reference.

## Build & run

```sh
g++ queens_backtrack.cpp -o queens_backtrack && ./queens_backtrack
```

Enter the board size N when prompted (e.g. 8 → 92 solutions).

## Simulation test run (2026-10-08)

Built with g++ (MinGW-w64, `-Wall -Wextra -O2`) and javac 21 in a temporary folder.
Each program was run **100 times** with N drawn at random from 1-12 (seed 170; every N
from 1 to 12 occurs 5-13 times). A driver fed the real stdin (N, then `1` at every
"continue" prompt) and checked every printed board: valid placement, no duplicates, and the
solution count equal to the known value (1, 0, 0, 2, 10, 4, 40, 92, 352, 724, 2680, 14200).
`NQueens` was driven through its public `placeNQueens()`. 147,041 boards checked per program.

| Program | Result |
|---------|--------|
| `queens_backtrack.cpp` | 100/100 correct |
| `queens2.cpp` | 100/100 correct |
| `queens_heuristic.cpp` | 100/100 correct |
| `NQueens.java.txt` | 100/100 correct; own `main()` prints 2, 10, 92 for N = 4, 5, 8 |

Edge inputs: N = 0, -3, and non-numeric input are rejected by all three; N = 51 is
rejected by `queens2`, N = 251 by `queens_heuristic`. Answering `0` at the first prompt
stops after 10 boards in all three.

**Findings (recorded, not fixed):**

| # | Where | Finding |
|---|-------|---------|
| 1 | `queens_backtrack.cpp`, `queens_heuristic.cpp` `printArray` | `choice` is an uninitialized local. If the answer at the "continue" prompt is not a number, `scanf` fails and `choice` keeps a garbage value (undefined behavior). Observed with input `x`: backtrack stopped after 10 boards, heuristic printed all 92. `queens2.cpp` declares it `static`, so it is 0 and the program stops. |
| 2 | `queens_heuristic.cpp:120` | With `-O2`, g++ warns `'leastval' may be used uninitialized`. The "no warnings" note above holds only without optimization. Answers were correct in all 100 runs. |
