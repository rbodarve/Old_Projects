<div align="center">

# 🧠 CMSC 170 — Introduction to Artificial Intelligence

**Coursework archive of class exercises and machine problems in C++, Java, and Prolog.**

![Java](https://img.shields.io/badge/Java-lightgrey)
![Prolog](https://img.shields.io/badge/Prolog-SWI--Prolog-red)
![C++](https://img.shields.io/badge/C%2B%2B-blue)
![Course](https://img.shields.io/badge/course-CMSC%20170%20·%20UP%20Mindanao-8A1538)
![README style](https://img.shields.io/badge/README-Amazing%20GitHub%20Template-brightgreen)

[Overview](#folder-overview) &nbsp;·&nbsp; [Details](#details) &nbsp;·&nbsp; [Build & Run Notes](#build--run-notes) &nbsp;·&nbsp; [Sources](#acknowledgements--sources)

</div>

---

## Table of Contents

- [About](#about)
- [Folder Overview](#folder-overview)
- [Details](#details)
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
The sources were reviewed and repaired for modern SWI-Prolog 9.x — see
[Prolog Files/ABOUT.md](Prolog%20Files/ABOUT.md) for the file-by-file breakdown and change log.

### Graph Stuff/
A Java graph library: adjacency-matrix (`GraphMatrix*`) and adjacency-list (`GraphList*`)
implementations for directed and undirected graphs, with `Vertex`/`Edge` classes, iterators,
a `DepthFirstSearch`, and a `GraphTest` driver. The class layout follows the `structure5`
library from Duane A. Bailey's *Java Structures* (see [Sources](#acknowledgements--sources)).
The folder was reviewed and repaired to compile and run correctly — see
[Graph Stuff/ABOUT.md](Graph%20Stuff/ABOUT.md) for the change log.

### Knapsack/
0/1 Knapsack solutions: a dynamic-programming solver
([ZeroOneKnapsack.java](Knapsack/ZeroOneKnapsack.java)) and a Swing branch-and-bound solver
([Knapsack.java](Knapsack/Knapsack.java)), alongside text-dump references and an archived
submission. The solvers were reviewed and had several logic bugs repaired — see
[Knapsack/ABOUT.md](Knapsack/ABOUT.md) for the change log.

### TicTacToe/
A playable Swing Tic-Tac-Toe ([TicTacToeMain.java](TicTacToe/TicTacToeMain.java)) whose
computer opponent ([TicTacToeAI.java](TicTacToe/TicTacToeAI.java)) plays a heuristic strategy
rather than full minimax search. The AI was reviewed and repaired — see
[TicTacToe/ABOUT.md](TicTacToe/ABOUT.md) for the analysis and change log.

### Queen/
N-Queens solvers in C++ — three approaches (backtracking, a stack-based non-recursive version
using Wirth's three-boolean-array method, and a heuristic variant) — plus a Java reference
version. Originally Turbo C++ code, since made to build cleanly on modern compilers; see
[Queen/ABOUT.md](Queen/ABOUT.md) for the file breakdown and change log.

## Build & Run Notes

- Several Java sources are stored with a `.java.txt` extension (e.g. `NQueens.java.txt`,
  `KnapsackBacktrack.java.txt`). Rename them to `.java` before compiling.
- Prolog files run under [SWI-Prolog](https://www.swi-prolog.org/).

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
