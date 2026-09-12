//package teneyck.graphstuff;
import java.util.*;  //Iterator
public interface Graph {
  public void add(Object label);
    //precondition:     label is a non-null label for a vertex
    //post_condition:   a vertex with label is added to the graph
    //                  if a vertex with label is already present, no action
  public void addEdge(Object vrtx1, Object vrtx2, Comparable label);
    //precondition:     vrtx1 and vrtx2 are labels of existing vertices
    //post-condition:   and edge (possibly directed) is inserted between
    //                  vrtx1 and vrtx2.
  public Object remove(Object label);
    //precondition:     label is non-null vertex label
    //post-condition:   vertex with this label is removed, if found
  public Object removeEdge(Object vrtx1, Object vrtx2);
    //precondition:     vertex1 and vertex2 are existing vertex labels
    //post-condition:   edge is removed and its label returned
  public Object get(Object label);
    //precondition:     none
    //post-condition:   returns the label of the indicated vertex
  public Vertex getVertex(Object label);
    //precondition:     none
    //post-condition:   returns the Vertex of the indicated label
  public Edge getEdge(Object vrtx1, Object vrtx2);
    //post-condition:   returns label of edge between the two verices
  public boolean contains(Object label);
    //post-condition:   returns true if vertex with this label is present
  public boolean containsEdge(Object vrtx1, Object vrtx2);
    //post-condition:   returns true if edge between vertices exists
  public boolean visit(Object label);
    //post-condition:   sets visited flag to true, returns previous value
  public boolean visitEdge(Edge e);
    //post-condition:   sets visited flag on edge, returns previous value
  public boolean isVisited(Object label);
    //post-condition:   returns value of visited flag of labeled vertex
  public boolean isVisitedEdge(Edge e);
    //post-condition:   returns value of visited flag on edge
  public void reset( );
    //post-condition:   resets all visited flags to false
  public int size( );
    //post-condition:   returns the number of vertices in the graph
  public int degree(Object label);
    //precondition:     label identifies an existing vertex
    //post-condition:   returns the number of vertices adjacent to vertex
  public int edgeCount( );
    //post-condition:   returns the number of edges in the graph;
  public Iterator iterator( );
    //post-condition: returns an iterator across all vertices in the graph
  public Iterator neighbors(Object label);
    //precondition:     label identifies an existing vertex
    //post-condition:   returns an iterator over the adjacent, out-going
    //                  vertices from the labeled vertex
  public Iterator edges( );
    //post-condition:   returns an iterator over edges in the graph
    //                  each edge is visited once.
  public void clear( );
    //post-condition:   removes all vertices (and edges) from the graph
  public boolean isEmpty( );
    //post-condition:   returns true if graph contains no vertices
  public boolean isDirected( );
    //post-condition:   returns true is edges of graph are directed
}
                         