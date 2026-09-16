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
Note: these files were reviewed and fixed to run cleanly under modern SWI-Prolog (9.x).
See the [Addendum — Prolog Files fixes](#addendum--prolog-files-fixes-2026-09-16) for details.

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

---

## Addendum — Prolog Files fixes (2026-09-16)

The `Prolog Files/` folder was reviewed and repaired so every source loads and runs
cleanly under **SWI-Prolog 9.x** (verified with 9.0.4). Original algorithm logic and
authorship were preserved; changes were limited to defects that stopped the files from
loading or running correctly, plus warning cleanup. Of the 20 `.pl` files, 14 were
modified and 5 were already correct (`Nani.png` is a non-code asset).

### Syntax errors (files would not load)
- **`Villamorfamily.pl`** — `sibling/2` was missing a comma before the negation
  (`mother(M,Y)\+(X=Y)` → `mother(M,Y), \+(X=Y)`).
- **`mata_familytree.pl`** — `aunt/2` ended with a stray trailing comma / empty goal
  (`parent(X,A), .` → `parent(X,A).`).

### Runtime crash — expert systems
- **`Odarve_Palmares_Expert_System.pl`, `test.pl`, `palencia_mata_expert_system.pl`** —
  added a `:- dynamic known/3.` declaration at the top of each. These programs call
  `asserta(known(...))` to remember answers, but `known/3` is also defined as a static
  fact. Older SWI-Prolog silently made such predicates dynamic; SWI 9.x rejects it with
  *"No permission to modify static procedure `known/3`"*. The declaration restores the
  original interactive behavior.

### Correctness bugs
- **`test.pl`** — the rule heads `handseals(x)`, `weakness(x)`, `bloodline(x)` used a
  lowercase atom `x` while the bodies used the variable `X`, so the predicates never
  matched real queries. Heads corrected to `handseals(X)` / `weakness(X)` / `bloodline(X)`.
- **`family.pl`** — `mother/2` was called by `brother/2` and `somebodysparent/1` but never
  defined (only `father/2` existed), causing an *Unknown procedure: mother/2* error.
  Added `mother(X,Y):- parent(X,Y), female(X).`
- **`listdemo.pl`** — `dodelete/3` built its result list with arithmetic evaluation
  (`Mnew is [Y|M]`), throwing a `type_error` for any non-head element. Changed to
  unification (`Mnew = [Y|M]`).
- **`Mata_Palencia_advanced.pl`** — `trim/3`'s guard `N<X;N=X` parsed as
  `(…, N<X) ; (N=X)` (comma binds tighter than `;`), leaving `N` unbound in the second
  branch. Wrapped as `(N<X;N=X)` so the size check applies to both alternatives.

### Cleanup (no behavior change)
- **Mojibake** — the byte `0x96` (a Windows-1252 en-dash) appeared in comment lines of the
  three expert-system files, producing *Illegal UTF-8* warnings. Replaced with ASCII `-`.
- **Singleton-variable warnings** — unused variables were renamed to `_` across
  `Mata_Palencia_advanced.pl`, `Odarve_list.pl`, `family.pl`, `listdemo.pl`,
  `mata_recursion_list.pl`, `OdarvePalmares_list_advanced.pl`, `OdarveTabilla_recursion.pl`,
  `lipa_villamor_recursion.pl`, and `mata_recursion.pl`.
- **`family.pl`** — two adjacent clauses were reordered so `somebodysparent/1` and
  `hasnochild/1` clauses are contiguous, clearing a *discontiguous predicate* warning.

### Unchanged (already correct)
`Odarve_family.pl`, `Odarve_Palmares_Nani.pl`, `input.pl`, `sample2.pl`, `test2.pl` load
and run cleanly as-is and were not modified.

### Verification
All 20 `.pl` files load with **zero warnings and zero errors**; `list_undefined` reports no
undefined predicates; and the computational predicates (family relations, list operations,
recursion/fibonacci/power, and all three interactive expert systems) were run and produce
correct results.

### Known non-issues (left as-is)
- The `even`/`evenpositions` predicates print the 1st and 3rd elements — correct under
  0-indexed "positions", off-by-one if read as 1-indexed. Ambiguous, not an error.
- `mata_familytree.pl`'s `aunt/2` returns correct results but with duplicate solutions on
  backtracking (no distinct/`\=` guard) — common in naive family trees.
