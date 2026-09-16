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
The bulk of the coursework. Includes:
- **Family-tree and recursion exercises** (`*_family.pl`, `*_recursion.pl`, `family.pl`, `mata_familytree.pl`).
- **List manipulation** (`Odarve_list.pl`, `listdemo.pl`, `*_list_advanced.pl`).
- **Expert systems** — a Naruto jutsu-type classifier (`Odarve_Palmares_Expert_System.pl`) and
  a paired variant (`palencia_mata_expert_system.pl`), plus `Odarve_Palmares_Nani.pl`.
- **`Lectures in Prolog/`** — course handouts (`.doc`) on expert systems and lists.

Run with SWI-Prolog: `swipl Odarve_family.pl`, then query at the prompt.
Note: some files contain non-ASCII encoding artifacts (mojibake) in comments/strings.

### Graph Stuff/
A Java graph library: adjacency-matrix (`GraphMatrix*`) and adjacency-list (`GraphList*`)
implementations for directed and undirected graphs, with `Vertex`/`Edge` classes, iterators,
a `DepthFirstSearch`, and a `GraphTest` driver. The class layout (e.g. `GraphListVertex`,
`GraphMatrixVertex`, `GraphListEdgeIterator`) follows the `structure5` library from Duane A.
Bailey's *Java Structures* (see [Sources](#acknowledgements--sources)).

### Knapsack/
0/1 Knapsack solutions: dynamic programming ([ZeroOneKnapsack.java](Knapsack/ZeroOneKnapsack.java)),
backtracking, and branch-and-bound. `Knap.inp` holds sample input; `Odarve_Tabilla_Knapsack.rar`
is an archived submission.

### TicTacToe/
Playable Tic-Tac-Toe. The AI ([TicTacToeAI.java](TicTacToe/TicTacToeAI.java)) uses a simple
heuristic — take a winning move if available, otherwise block the opponent's winning move —
rather than full minimax search. `TicTacToeMain` is the entry point.

### Queen/
N-Queens solvers: a C++ file (`queens.cpp`, `queens2.cpp`) with three approaches (backtracking,
a stack-based non-recursive version using Wirth's three-boolean-array method, and a heuristic
variant), plus a Java backtracking version (`NQueens.java`).

## Build & Run Notes

- Several Java sources are stored with a `.java.txt` extension (e.g. `NQueens.java.txt`,
  `KnapsackBacktrack.java.txt`). Rename them to `.java` before compiling.
- The C++ N-Queens code was originally written for Turbo C++ and may need adjustment on
  modern compilers.
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
