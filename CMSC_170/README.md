<div align="center">

# 🧠 CMSC 170 — Introduction to Artificial Intelligence

**Coursework archive of class exercises and machine problems in C++, Java, and Prolog.**

![Java](https://img.shields.io/badge/Java-lightgrey)
![Prolog](https://img.shields.io/badge/Prolog-SWI--Prolog-red)
![C++](https://img.shields.io/badge/C%2B%2B-blue)
![Course](https://img.shields.io/badge/course-CMSC%20170%20·%20UP%20Mindanao-8A1538)
![README style](https://img.shields.io/badge/README-Amazing%20GitHub%20Template-brightgreen)

[Overview](#folder-overview) &nbsp;·&nbsp; [Details](#details) &nbsp;·&nbsp; [Test Results](#test-results) &nbsp;·&nbsp; [Build & Run Notes](#build--run-notes) &nbsp;·&nbsp; [Sources](#acknowledgements--sources)

</div>

---

## Table of Contents

- [About](#about)
- [Folder Overview](#folder-overview)
- [Details](#details)
- [Test Results](#test-results)
- [Build & Run Notes](#build--run-notes)
- [Acknowledgements & Sources](#acknowledgements--sources)

## About

Coursework archive for **CMSC 170 (Introduction to Artificial Intelligence)**, UP Mindanao —
a collection of class exercises and machine problems, organized by topic. These are standalone
source files: there is no build system, so each is compiled or run individually.

## Folder Overview

| Folder | Language | Topic |
|---|---|---|
| [Prolog Files/](Prolog%20Files/) | Prolog | Logic programming: facts, recursion, lists, and expert systems |
| [Graph Stuff/](Graph%20Stuff/) | Java | Graph representations and traversal (matrix & adjacency list, DFS) |
| [Knapsack/](Knapsack/) | Java | 0/1 Knapsack via DP, backtracking, and branch-and-bound |
| [TicTacToe/](TicTacToe/) | Java | Playable Tic-Tac-Toe with a heuristic AI opponent |
| [Queen/](Queen/) | C++ / Java | N-Queens solved with backtracking, stacks, and heuristics |

## Details

### Prolog Files/
Logic-programming coursework: facts and family trees, recursion, list manipulation, and
interactive expert systems, plus course handouts under `Lectures in Prolog/`.
Run with SWI-Prolog: `swipl Odarve_family.pl`, then query at the prompt.
The sources were reviewed and repaired for modern SWI-Prolog 9.x and load cleanly on 10.0.2.
A simulation test run found 8 remaining defects in the original student logic (recorded,
not fixed) — see [Prolog Files/ABOUT.md](Prolog%20Files/ABOUT.md) for the file-by-file
breakdown, change log, and test results.

### Graph Stuff/
A Java graph library: adjacency-matrix (`GraphMatrix*`) and adjacency-list (`GraphList*`)
implementations for directed and undirected graphs, with `Vertex`/`Edge` classes, iterators,
a `DepthFirstSearch`, and a `GraphTest` driver. The class layout follows the `structure5`
library from Duane A. Bailey's *Java Structures* (see [Sources](#acknowledgements--sources)).
The folder was reviewed and repaired to compile and run correctly. Both demos give correct
results; a simulation test run found 4 remaining defects in the adjacency-list classes
(recorded, not fixed) — see [Graph Stuff/ABOUT.md](Graph%20Stuff/ABOUT.md) for the change log
and test results.

### Knapsack/
0/1 Knapsack solutions: a dynamic-programming solver
([ZeroOneKnapsack.java](Knapsack/ZeroOneKnapsack.java)) and a Swing branch-and-bound solver
([Knapsack.java](Knapsack/Knapsack.java)), two textbook solvers stored as text
(`KnapsackBacktrack.java.txt`, `KnapsackBandB.java.txt`), text-dump references, and an
archived submission. The two main solvers were reviewed, had several logic bugs repaired, and
gave the optimal answer in every test. The textbook solvers and the sample `Knap.inp` have
4 recorded defects (not fixed) — see [Knapsack/ABOUT.md](Knapsack/ABOUT.md) for the change
log and test results.

### TicTacToe/
A playable Swing Tic-Tac-Toe ([TicTacToeMain.java](TicTacToe/TicTacToeMain.java)) whose
computer opponent ([TicTacToeAI.java](TicTacToe/TicTacToeAI.java)) plays a heuristic strategy
rather than full minimax search. The AI was reviewed and repaired; an exhaustive game-tree
check and 100 simulated games show it never loses — see
[TicTacToe/ABOUT.md](TicTacToe/ABOUT.md) for the analysis, change log, and test results.

### Queen/
N-Queens solvers in C++ — three approaches (backtracking, a stack-based non-recursive version
using Wirth's three-boolean-array method, and a heuristic variant) — plus a Java reference
version. Originally Turbo C++ code, since made to build cleanly on modern compilers. All four
solvers gave the correct solution count in every test; 2 minor issues are recorded (not
fixed) — see [Queen/ABOUT.md](Queen/ABOUT.md) for the file breakdown, change log, and test
results.

## Test Results

Simulation test run, 2026-10-08 (SWI-Prolog 10.0.2, Java 21.0.12, MinGW-w64 g++). Each
program was run about 100 times with random input, and every answer was compared to an
independent oracle (brute force, built-ins, or a simple model). Defects were recorded in each
folder's ABOUT.md and **not fixed**.

| Folder | Result | Remaining defects (details in ABOUT.md) |
|---|---|---|
| [Prolog Files/](Prolog%20Files/ABOUT.md#5-simulation-test-run-2026-10-08-swi-prolog-1002) | All 19 files load; recursion, math, Nani, `input.pl` and `family.pl` 100% correct; 300 expert-system sessions over stdin all correct | `aunt`/`uncle` include own parents (`Odarve_family`); data typos and reversed `son`/`daughter` (`Villamorfamily`); `sumpositive` fails on zeros / trailing negatives; `even`/`traverse` lack a base case; extra `getmin` answer; expert systems repeat questions; 7 unreachable rules in `test.pl` |
| [Graph Stuff/](Graph%20Stuff/ABOUT.md#6-simulation-test-run-2026-10-08-javacjava-21012) | Both demos correct; all 4 graph classes 100/100 on random operation sequences; DFS edge labels and `BinaryHeap` 100/100 | List classes: `removeEdge` returns `null` label, `degree` is out-degree only (matrix: out + in), `iterator()` returns vertices (matrix: labels), undirected `removeEdge` fails in reverse orientation |
| [Knapsack/](Knapsack/ABOUT.md#6-simulation-test-run-2026-10-08-javacjava-21012) | `ZeroOneKnapsack` and `Knapsack.java` 100/100 optimal | Textbook solvers crash when no item fits; `KnapsackBandB` misses exact-fill optima and needs a missing `Queue` class; `Knap.inp` gives profit 0 |
| [Queen/](Queen/ABOUT.md#simulation-test-run-2026-10-08) | All 4 solvers 100/100 (147,041 boards checked each) | Non-number at the "continue" prompt is undefined behavior; one `-O2` warning |
| [TicTacToe/](TicTacToe/ABOUT.md#6-simulation-test-run-2026-10-08-javacjava-21012) | 100 games through the real GUI: AI 61 wins, 39 draws, 0 losses | None |

## Build & Run Notes

Requirements: [SWI-Prolog](https://www.swi-prolog.org/) (`swipl`), a JDK (`javac`/`java`,
tested with 21), and a C++ compiler (`g++`). Run each command from inside the folder named
in its heading. The commands work in PowerShell and Git Bash. Java classes are compiled
into an `out/` folder, so the committed `.class` files stay unchanged.

### Prolog Files/

Load a file, then type queries at the `?-` prompt. End every query with a period.

```sh
swipl mata_recursion.pl
?- hasfibonacci(10, F).          % F = 55
?- halt.
```

- Press `;` for the next answer. Press Enter to stop.
- Expert systems (`Odarve_Palmares_Expert_System.pl`, `test.pl`,
  `palencia_mata_expert_system.pl`): query `start(X).`, then answer each question with
  `yes.` or `no.`
- One query without the prompt (put options before the file name):
  `swipl -q -g "hasfibonacci(20,F), writeln(F)" -t halt mata_recursion.pl`

Example queries:

| File | Query |
|---|---|
| `mata_recursion.pl` (also `OdarveTabilla_`, `lipa_villamor_recursion.pl`) | `raisedTo(2, 10, R).` |
| `Odarve_list.pl`, `mata_recursion_list.pl` | `hasaverage([1,2,3,4], A).` |
| `listdemo.pl` | `unique([a,b,a,c], U).` |
| `Mata_Palencia_advanced.pl` | `sortasc([5,3,8,1], S).` |
| `OdarvePalmares_list_advanced.pl` | `split([5,1,8,3], 4, Small, Big).` |
| `family.pl`, `Odarve_family.pl` | `brother(B, lilian).` |
| `Villamorfamily.pl` | `sibling(clint, S).` |
| `mata_familytree.pl` | `cousins(jeff, C).` |
| `Odarve_Palmares_Nani.pl` | `list_things(kitchen).` |
| `sample2.pl` / `test2.pl` | `factorial(5, F).` / `isprime(7).` |
| `input.pl` | `loader('somefile.pl').` |

To see all answers at once: `findall(S, sibling(renaire, S), L).`

### Graph Stuff/

```sh
javac -d out *.java
java -cp out GraphTest           # city graph, edge listing, edges sorted by weight
java -cp out DepthFirstSearch    # DFS with tree/back/forward/cross edge labels
```

### Knapsack/

```sh
javac -d out ZeroOneKnapsack.java
java -cp out ZeroOneKnapsack     # dynamic programming on a built-in 4-item example

javac -d out Knapsack.java
java -cp out knapsack.Knapsack   # Swing window: open an input file with the file button
```

Input file format: first line is the capacity, then one `profit weight` pair per line.
Do not include an item-count line: the reader takes any one-number line as the capacity.
The shipped `Knap.inp` has such a line (`5`), so it gives Max Profit 0 (see Knapsack/ABOUT.md).

`KnapsackBacktrack.java.txt` and `KnapsackBandB.java.txt` are stored as text. Copy one to
a `.java` file to run it, e.g. `cp KnapsackBandB.java.txt KnapsackBandB.java`, then compile
and run it like the files above. `KnapsackBandB` does not compile on its own: it needs a
`Queue` class with `enqueue`/`dequeue`/`isEmpty` that is not in this folder.

### TicTacToe/

```sh
javac -d out *.java
java -cp out TicTacToeMain       # Swing window: you play against the AI
```

### Queen/

```sh
g++ queens_backtrack.cpp -o queens_backtrack
./queens_backtrack               # enter N, e.g. 8 -> 92 solutions
```

- `queens2.cpp` (stack method) and `queens_heuristic.cpp` build and run the same way.
- After every 10 solutions, the program asks: enter `1` to continue or `0` to stop.
- `NQueens.java.txt` (Java version, solves N = 4, 5, 8): copy it to `NQueens.java`, then
  `javac -d out NQueens.java` and `java -cp out NQueens`.

## Acknowledgements & Sources

- **README template** — [Amazing GitHub Template](https://github.com/dec0dOS/amazing-github-template)
  by **dec0dOS**, via [awesome-readme](https://github.com/matiassingers/awesome-readme) (**Matias Singers**).
- **Course** — CMSC 170, Introduction to Artificial Intelligence, University of the Philippines Mindanao.
- **Graph library** — data-structure design follows the `structure5` package accompanying
  Duane A. Bailey, *Java Structures: Data Structures in Java for the Principled Programmer*
  (McGraw-Hill). See <https://www.cs.williams.edu/~bailey/JavaStructures/>.
- **N-Queens (stack method)** — Niklaus Wirth, *Algorithms + Data Structures = Programs*
  (Prentice-Hall, 1976), three-boolean-array formulation.
- **Prolog** — SWI-Prolog: <https://www.swi-prolog.org/> (Wielemaker et al.).
- **Note** — student submissions retain their original authors' names in filenames; this
  archive collects coursework and is not claimed as original algorithm research.
