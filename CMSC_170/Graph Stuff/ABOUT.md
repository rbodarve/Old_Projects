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
