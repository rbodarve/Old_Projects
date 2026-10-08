# Graph Stuff — Change Log & Analysis

This document records the full analysis of the **Graph Stuff** folder and every change
made to it, in the order the work happened. The folder is a Java graph library (adjacency
list and adjacency matrix implementations) plus two runnable demos.

---

## 1. Starting point

The folder contained the following files (all pre-existing, no `about.md`):

| File | Role |
|------|------|
| `Graph.java` | The `Graph` interface (contract for all implementations) |
| `Edge.java` | An edge; implements `Comparable` (ordered by edge label) |
| `Vertex.java` | Base vertex with a visited flag |
| `GraphList.java` | Abstract adjacency-**list** graph (shared logic) |
| `GraphListVertex.java` | Vertex holding a `LinkedList` of incident edges |
| `GraphListIterator.java` | Iterates adjacent **vertices** |
| `GraphListEdgeIterator.java` | Iterates all **edges** (each once) |
| `DirectedGraphList.java` | Concrete directed adjacency-list graph |
| `UndirectedGraphList.java` | Concrete undirected adjacency-list graph |
| `GraphMatrix.java` | Abstract adjacency-**matrix** graph (shared logic) |
| `GraphMatrixVertex.java` | Vertex holding a matrix row/column index |
| `GraphMatrixDirected.java` | Concrete directed adjacency-matrix graph |
| `GraphMatrixUndirected.java` | Concrete undirected adjacency-matrix graph |
| `DepthFirstSearch.java` | Demo: DFS with tree/back/forward/cross edge classification |
| `GraphTest.java` | Demo: builds a city graph, lists edges, sorts them via a heap |

Environment used for analysis: `javac`/`java` **21.0.12**.

---

## 2. Analysis findings

The folder was compiled and both demos were run to observe real behavior. One **compile
error** and several **logic/runtime errors** were found. Each was reproduced with a small
test harness before any change was made.

### Compile error

- **[C1] Missing `BinaryHeap` class.** `GraphTest.java` used `new BinaryHeap()`, `add`,
  `deleteMin`, and `isEmpty`, but no `BinaryHeap.java` existed anywhere in the repo.
  `javac` reported 2 errors and the whole folder would not build.

### Logic / runtime errors (all reproduced)

- **[L1] `GraphMatrix.degree()` returns the wrong count.** The loop guard was
  `for (int i = 0; i < size && i != row; i++)`. The `i != row` term is a *loop
  termination* condition, so the loop stopped the moment `i` reached the vertex's own
  index instead of merely skipping that one cell. A vertex at index 0 with 3 edges
  reported `degree == 0`. Affected the directed (out+in) and undirected branches.

- **[L2] `DirectedGraphList.remove()` throws `ConcurrentModificationException`.** It
  iterated a vertex's adjacency list while calling `removeEdge` on that same list. With
  2 edges it silently removed only one; with 3+ edges it threw.

- **[L3] `UndirectedGraphList.remove()` throws `ClassCastException`.** It read
  `e.here()` / `e.there()` (which return vertex **labels**, e.g. `String`) and cast them
  to `GraphListVertex`. It also had the same iterate-while-mutating hazard as [L2].

- **[L4] `Edge` `directed` flag set inconsistently.** `UndirectedGraphList.addEdge`
  passed `true` for an undirected edge, and `GraphMatrixDirected.addEdge` passed `false`
  for a directed edge. Latent only because `Edge.equals()` ignores the flag.

- **[L5] `GraphMatrix.remove()` NPE on an absent label.** It dereferenced the result of
  `dict.remove(label)` with no null check.

- **[L6] `GraphList.getEdge()` was direction-biased.** It only matched an edge from its
  `here` side, so `getEdge(v2, v1)` returned `null` for an undirected edge stored as
  `(v1, v2)`. It also returned a stale, non-matching edge instead of `null` when nothing
  was found.

---

## 3. Changes made

Changes were applied in priority order. Compilation was re-verified after each, and a
regression test suite (14 checks) plus both demos were run at the end.

### Fix #1 — added `BinaryHeap.java` (resolves [C1])

Created a new minimal array-based **binary min-heap** (`add`, `deleteMin`, `isEmpty`,
`size`) in the same raw-types style as the rest of the folder. `Edge` already implements
`Comparable`, so `GraphTest`'s "ordered listing of edges" now works: the demo prints all
32 edges in ascending weight order. This restores the intended behavior rather than
deleting the test section.

### Fix #2 — `GraphMatrix.degree()` (resolves [L1])

Changed each loop from `for (int i = 0; i < size && i != row; i++)` to
`for (int i = 0; i < size; i++)` with the self-index skip moved inside:
`if (i != row && data[row][i] != null) count++;`. The loop now scans the entire row/column
and merely skips the self-loop cell.

### Fix #3 — `DirectedGraphList.remove()` (resolves [L2])

Removed the redundant first loop that mutated the adjacency list mid-iteration. The
vertex's own outgoing edges are discarded when the vertex is dropped from the dictionary,
and incoming edges are removed via the existing `edges()` loop, which iterates over a
**snapshot** list and is therefore safe to mutate against. Added a null guard on the
vertex lookup.

### Fix #4 — `UndirectedGraphList.remove()` (resolves [L3])

Rewrote the removal to:
1. **Snapshot** the vertex's incident edges into a separate list (avoids concurrent
   modification).
2. For each edge, resolve the **other** endpoint via `dict.get(other)` and remove the
   edge from that neighbor's adjacency list (fixes the bad cast — we look the vertex up
   instead of casting a label).
3. Drop the vertex from the dictionary.
Added a null guard on the vertex lookup.

### Fix #5 — `Edge` `directed` flag (resolves [L4])

- `UndirectedGraphList.addEdge` / `removeEdge`: `true` → `false`.
- `GraphMatrixDirected.addEdge`: `false` → `true`.

### Fix #6 — `GraphMatrix.remove()` (resolves [L5])

Added `if (vert == null) return null;` after the dictionary lookup, so removing an absent
label returns `null` instead of throwing an NPE.

### Fix #7 — `GraphList.getEdge()` (resolves [L6])

When the graph is undirected, the match now also accepts the reversed orientation. The
method now returns `null` when no edge is found (previously it could return a stale,
non-matching edge), matching the documented "returns null" exception.

---

## 4. Verification

- **Compile:** all 16 `.java` files compile with **0 errors** (only the pre-existing
  `new Integer(...)` deprecation warnings remain — intentionally left untouched as out of
  scope).
- **Demos:**
  - `GraphTest` lists all **32 edges in ascending order** via the new `BinaryHeap`.
  - `DepthFirstSearch` classifies all **13 edges** (tree/back/forward/cross).
- **Regression tests:** a 14-check suite covering matrix `degree` (directed in+out and
  undirected), all three `remove()` paths, undirected `getEdge` orientation, and the
  absent-label guard — **14/14 passed**.

---

## 5. Known remaining item (out of scope, not changed)

`Edge.equals()` is orientation-sensitive. This only affects
`UndirectedGraphList.removeEdge()` if an edge is removed using the opposite vertex order
from how it was added — a case not exercised anywhere in the folder. Hardening it would be
a broader semantic change than the reported bugs, so it was deliberately left as-is.

---

## 6. Simulation test run (2026-10-08, javac/java 21.0.12)

All 16 files compile (deprecation/unchecked notes only). Classes were compiled to a
temporary directory, so the committed `.class` files were not touched.

**Demos (as shipped, `GraphMatrixDirected`):**
- `GraphTest`: 10 vertices / 37 edges, then `removeEdge(NewYork, SanFrancisco)` and
  `remove(Denver)` (4 edges) give 9 / 32. The heap listing prints all 32 edges in
  ascending order. Correct.
- `DepthFirstSearch`: all 13 edge classifications checked by hand against discovery/finish
  times (e.g. `9->10` is cross: 10 finished at 17, 9 discovered at 18). Correct.

**Demos with the commented-out `DirectedGraphList` line swapped in:** `GraphTest` gives the
same counts and the same sorted edge set. `DepthFirstSearch` visits neighbors in a
different order, so the tree is different, but all 13 classifications are valid for that tree.

**Interface test (29 checks per class, same graph A-B, A-C, B-C, C-D):**

| Class | Result |
|-------|--------|
| `GraphMatrixDirected` | 29/29 |
| `GraphMatrixUndirected` | 29/29 |
| `UndirectedGraphList` | 28/29 |
| `DirectedGraphList` | 25/29 |

**Defects / inconsistencies found (recorded, not fixed):**

| # | Where | Finding |
|---|-------|---------|
| 1 | `GraphListVertex.removeEdge` | Returns the probe edge `e` (built with a `null` label), not the stored edge. So `removeEdge(v1, v2)` on both list graphs returns `null` instead of the label, against its documented post-condition. The edge is still removed. |
| 2 | `GraphList.degree` vs `GraphMatrix.degree` | List graphs return out-degree only; matrix graphs return out + in for directed graphs. Same directed graph: `degree(C)` is 1 (list) vs 3 (matrix). The interface comment does not decide which is right. |
| 3 | `GraphList.iterator` vs `GraphMatrix.iterator` | List graphs iterate `GraphListVertex` objects (`dict.values()`); matrix graphs iterate labels (`dict.keySet()`). Code that sorts or casts the results works for one family and throws `ClassCastException` for the other. Printing works for both because `toString` gives the label. |

### 6.1 Randomized simulation: 100 runs per program (2026-10-08)

Each check ran 100 times with random input (fixed seeds). The oracle is a plain
set-of-vertices / map-of-edges model in the test, not the classes under test.

**Random operation sequences** (1-8 start vertices, then 40 random `addEdge`, `removeEdge`,
`add`, `remove`). After **every** operation the test compares `size`, `edgeCount`, `edges()`,
`iterator()`, `neighbors`, `containsEdge` and `getEdge` (label, and both orientations for
undirected graphs) with the model.

| Class | Runs correct | `removeEdge` wrong label | `degree` differences |
|-------|-------------:|-------------------------:|----------------------|
| `GraphMatrixDirected` | 100/100 | 0 | 0 vs out + in; 6111 vs out-degree |
| `GraphMatrixUndirected` | 100/100 | 0 | 0 |
| `DirectedGraphList` | 100/100 | 616 (defect 1) | 6111 vs out + in; 0 vs out-degree (defect 2) |
| `UndirectedGraphList` | 100/100 | 612 (defect 1) | 0 |

Same runs, but undirected `removeEdge` called with a random orientation:
`GraphMatrixUndirected` 100/100, **`UndirectedGraphList` 5/100** (defect 4).

**`DepthFirstSearch`** (its private `dfs` called by reflection on 100 random directed graphs,
1-10 vertices, edge probability 0.25). Every edge's tree/back/forward/cross label was
compared with an independent DFS that uses the same neighbor order: **100/100** on
`GraphMatrixDirected` and **100/100** on `DirectedGraphList`.

**`BinaryHeap`** (`GraphTest`'s sorter): 100 random arrays of 0-59 edges; the `deleteMin`
order equals `Collections.sort`: **100/100**.

**New defect (this was the "known remaining item" in section 5):**

| # | Where | Finding |
|---|-------|---------|
| 4 | `UndirectedGraphList.removeEdge` | Removing an undirected edge with the opposite orientation from how it was added (`removeEdge(v,u)` for an edge added as `addEdge(u,v)`) does not remove it: `edgeCount` stays the same and the edge is still listed. Root cause: `Edge.equals` compares orientation. `GraphMatrixUndirected` handles both orientations. |
