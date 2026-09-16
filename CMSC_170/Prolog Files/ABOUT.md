# Prolog Files — Change Log & Analysis

This document records the review and repair of the **Prolog Files** folder so that every
source loads and runs cleanly under modern **SWI-Prolog 9.x** (verified with 9.0.4).
Original algorithm logic and authorship were preserved; changes were limited to defects
that stopped a file from loading or running correctly, plus warning cleanup.

Of the 19 `.pl` files, **14 were modified** and **5 were already correct**. `Nani.png` is a
non-code asset and the `Lectures in Prolog/` `.doc` files are handouts, not code.

---

## 1. Starting point

The folder is a coursework archive of Prolog exercises (student submissions retain their
authors' names in the filenames), grouped by topic:

| Group | Files |
|-------|-------|
| Family-tree / relations | `Odarve_family.pl`, `Villamorfamily.pl`, `mata_familytree.pl`, `family.pl` |
| Recursion | `OdarveTabilla_recursion.pl`, `mata_recursion.pl`, `lipa_villamor_recursion.pl` |
| Lists | `Odarve_list.pl`, `listdemo.pl`, `OdarvePalmares_list_advanced.pl`, `Mata_Palencia_advanced.pl`, `mata_recursion_list.pl` |
| Expert systems (interactive) | `Odarve_Palmares_Expert_System.pl`, `palencia_mata_expert_system.pl`, `test.pl`, `Odarve_Palmares_Nani.pl` |
| Misc / support | `input.pl`, `sample2.pl`, `test2.pl` |
| Non-code | `Nani.png`, `Lectures in Prolog/*.doc` |

The trigger for the work: several files failed to load or run under SWI-Prolog 9.x because
of syntax that older SWI-Prolog tolerated, predicates that were never defined, and a few
genuine logic bugs.

---

## 2. Findings & changes

Changes are grouped by severity, matching the order they were addressed.

### Syntax errors (file would not load)

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

---

## 3. Verification

- All 19 `.pl` files load with **zero warnings and zero errors** under SWI-Prolog 9.0.4.
- `list_undefined` reports **no undefined predicates**.
- The computational predicates were run and produce correct results: family relations,
  list operations, recursion/fibonacci/power, and all three interactive expert systems.

---

## 4. Known non-issues (left as-is)

- The `even` / `evenpositions` predicates print the 1st and 3rd elements — correct under
  0-indexed "positions", off-by-one if read as 1-indexed. Ambiguous, not an error.
- `mata_familytree.pl`'s `aunt/2` returns correct results but with duplicate solutions on
  backtracking (no distinct / `\=` guard) — common in naive family trees.
