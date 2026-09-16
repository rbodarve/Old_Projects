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
