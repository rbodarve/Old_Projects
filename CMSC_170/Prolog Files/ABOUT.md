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

---

## 5. Simulation test run (2026-10-08, SWI-Prolog 10.0.2)

All 19 files load without warnings. Each file was run with real queries in its own `swipl`
process, and the answers were compared to hand-computed values. The three expert systems
were driven over stdin by a script that answered `yes.`/`no.` from a fixed profile.

**Correct:** recursion (fib(20)=6765, 2^10=1024), `test2.pl` primes 1-40, `sample2.pl`
factorial, `family.pl`, `mata_familytree.pl`, `OdarvePalmares_list_advanced.pl`, `input.pl`,
first answers of `listdemo.pl` and `Mata_Palencia_advanced.pl`. The expert systems reached
the expected answer in every scenario (kakashi, madara, sasuke, usb, fourtcell, sdram, no match).

**Defects found (recorded, not fixed):**

| # | File | Defect |
|---|------|--------|
| 1 | `Odarve_family.pl` | `aunt`/`uncle` include the person's own parents: `aunt(francisca, renaire)` succeeds, but francisca is the mother. No check that the aunt/uncle is not the parent. |
| 2 | `Villamorfamily.pl` | Data typos: `parent(ernesto, celeste)` should be `cel` (so cel has no siblings); `cecil` has no `female` fact (alice gets one daughter, not two). |
| 3 | `Odarve_list.pl`, `mata_recursion_list.pl` | `sumpositive([0,5], P)` fails: no clause handles a 0 before the last element. The `mata_` version also fails when the list ends with a negative number. |
| 4 | `Odarve_list.pl`, `mata_recursion_list.pl`, `listdemo.pl` | `even` and `traverse` print correctly, then the goal fails: no base case for `[]`. (The Nani `list_*` predicates do the same on purpose: failure-driven loops.) |
| 5 | `Mata_Palencia_advanced.pl` | `getmin([5], M)` gives a second, wrong answer `M = 0` on backtracking (`getmin([],0)` is reachable). |
| 6 | All 3 expert systems | Questions repeat (e.g. `handseals:fast` asked 10 times in one session). In `ask/2`, the clause that asks comes before the clauses that read `known/3`, so remembered answers are never used. |
| 7 | `test.pl` | Rule pairs have identical conditions, so the second never fires: darui, sarutobi, jirobo, temari, lee, madara, kurenai are unreachable (a "lee" profile returns guy). |

**Notes for running non-interactively:** put options before the file
(`swipl -q -g Goal -t halt file.pl`); options after the file go to the program. On a pipe,
stdout is fully buffered, so a driver needs `set_stream(user_output, buffer(false))` before
the prompts appear. `volatile` is an operator, so its prompt prints as `volatility:(volatile)`.

### 5.1 Randomized simulation: 100 runs per program (2026-10-08)

Each program was run 100 times with random inputs (seed 170). Each answer was compared to an
independent oracle: an SWI-Prolog built-in (`msort`, `sum_list`, `max_list`, `partition`,
`last`, ...), a plain definition (iterative Fibonacci, trial-division primes), or textbook
relations computed from the raw `parent`/`male`/`female` facts.

| File | Checks (100 random inputs each) | Result |
|------|---------------------------------|--------|
| `OdarveTabilla_recursion.pl`, `mata_recursion.pl`, `lipa_villamor_recursion.pl` | all answers of `hasfibonacci` (n up to 22), `raisedTo` (base -5..5, exp 0..12) | 100/100 each |
| `sample2.pl` | `factorial` value (n 0..20) and its printed 1! .. n! | 100/100 |
| `test2.pl` | `isprime` (n 1..2000) | 100/100 |
| `OdarvePalmares_list_advanced.pl` | `split` = `partition` | 100/100 |
| `Mata_Palencia_advanced.pl` | `cutlast`, `size`, `trim`, `beg_small`, `split`, `sortasc` (first and all answers), `getmin` first answer | 100/100 each |
| | `getmin` all answers = [min] | **0/100** (defect 5) |
| `listdemo.pl` | `firstof`, `ismember`, `asc`, `unique`, `dodelete`, `lappend`, `lastof`, `lengthof`; `traverse` output | 100/100 each |
| | `traverse` goal succeeds | **0/100** (defect 4) |
| `Odarve_list.pl` | `hasaverage`, `sumsquare`, `getmax`, `maxpos`; `even` output | 100/100 each |
| | `sumpositive` | **85/100** (defect 3: a 0 before the last element) |
| | `even` goal succeeds | **0/100** (defect 4) |
| `mata_recursion_list.pl` | `hasaverage`, `sumsquare`, `getmax`; `even` output | 100/100 each |
| | `sumpositive` | **44/100** (defect 3: also fails when the list ends with a number <= 0) |
| | `even` goal succeeds | **0/100** (defect 4) |
| `family.pl` | 100 random relation queries (7 relations) | 100/100 |
| `Odarve_family.pl` | 100 random relation queries (10 relations) | **95/100**: `aunt` differs for 7 of 17 people, `uncle` for 4 (defect 1) |
| `Villamorfamily.pl` | 100 random relation queries (10 relations) | **89/100**: `son` and `daughter` (defect 8) |
| `mata_familytree.pl` | 100 random relation queries (8 relations) | **95/100**: `aunt`/`uncle` include in-laws (note below) |
| `Odarve_Palmares_Nani.pl` | `connected`, `list_connections` output, `list_things` output | 100/100 each |
| `input.pl` | `loader` on 100 random fact files | 100/100 |
| `Odarve_Palmares_Expert_System.pl` | 100 stdin sessions | 100/100; avg 22, max 48 questions for 17 distinct questions (defect 6) |
| `test.pl` | 100 stdin sessions | 100/100; only 12 distinct answers reachable (defect 7) |
| `palencia_mata_expert_system.pl` | 100 stdin sessions | 100/100; avg 18, max 38 questions (defect 6) |

Expert-system sessions: 50 profiles answer yes to all questions of one random rule (plus
10% random extra yes), 50 answer yes to each question with probability 0.3. The expected
answer is the first rule whose questions are all yes, computed from the rule bodies with
`clause/2`. The sessions used the real `read/1` path over stdin.

**New defect:**

| # | File | Defect |
|---|------|--------|
| 8 | `Villamorfamily.pl` | `son(X,Y)` and `daughter(X,Y)` have the arguments reversed: they mean "Y is a son/daughter of X" (`parent(X,Y), male(Y)`). `father`/`mother` in the same file, and `son`/`daughter` in the other family files, mean "X is ... of Y". |

**Note (definition, not a defect):** `mata_familytree.pl` defines `aunt(X,Y)` as "X is a parent
of Y's cousin", so it includes aunts and uncles by marriage (e.g. lorie, danilo). The oracle
uses blood relatives only.
