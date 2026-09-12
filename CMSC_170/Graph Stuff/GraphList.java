//package teneyck.graphstuff;
import java.util.*;  //Map, List, Iterator
abstract class GraphList implements Graph {
  protected Map dict;
  protected boolean directed;
  protected GraphList(boolean dir) {
    dict = new HashMap( );
    directed = dir;
  }
  public void add(Object label)  {
    //precondition:     label is a non-null label for a vertex
    //post_condition:   a vertex with label is added to the graph
    //                  if a vertex with label is already present, no action
    if (dict.containsKey(label) ) return; //already present
    GraphListVertex v = new GraphListVertex(label);
    dict.put(label, v);
  } 
  abstract public void addEdge(Object vrtx1, Object vrtx2, Comparable label);
    //precondition:     vrtx1 and vrtx2 are labels of existing vertices
    //post-condition:   and edge (possibly directed is inserted between
    //                  vrtx1 and vrtx2

  abstract public Object remove(Object label);
    //precondition:     label is non-null vertex label
    //post-condition:   vertex with this label is removed, if found

  abstract public Object removeEdge(Object vrtx1, Object vrtx2);
    //precondition:     vertex1 and vertex2 are existing vertex labels
    //post-condition:   edge is removed and its label returned

  public Object get(Object label) {
    //precondition:     labeled vertex is in the graph
    //post-condition:   returns the label of the indicated vertex
    GraphListVertex v = (GraphListVertex)dict.get(label);
    return v.label( );
  }
  public Vertex getVertex(Object label) {
    //precondition:     labeled vertex is present in the graph
    //post-condition:   returns the GraphListVertex for indicated label
    return (GraphListVertex)dict.get(label);
  }
  public Edge getEdge(Object vrtx1, Object vrtx2) {
    //precondition:     edge between two vertices exists
    //post-condition:   returns label of edge between the two verices
    //exception:        returns null
      GraphListVertex v1 = (GraphListVertex)dict.get(vrtx1);
      GraphListVertex v2 = (GraphListVertex)dict.get(vrtx2);
      Iterator itr = new GraphListEdgeIterator(dict);
      boolean found = false;
      Edge e = null;
      while (itr.hasNext( ) && !found) {
        e = (Edge)itr.next( );
        found =(e.here( ).equals(v1.label( )) && e.there( ).equals(v2.label( ))); 
      }
      return e;
  }
    
   
  public boolean contains(Object label) {
    //post-condition:   returns true if vertex with this label is present
    return dict.containsKey(label);
  }
  public boolean containsEdge(Object vrtx1, Object vrtx2) {
    //post-condition:   returns true if edge between vertices exists
    GraphListVertex v1 = (GraphListVertex)dict.get(vrtx1);
    Iterator itr = v1.adjacentEdges( );
    boolean flag = false;
    while (itr.hasNext( ) && !flag) {
      Edge e = (Edge)itr.next( );
      flag = ((e.here( ).equals(vrtx1) && e.there( ).equals(vrtx2))||
          (e.here( ).equals(vrtx2) && e.there( ).equals(vrtx1)));
    }
    return flag;
  }        
      
  public boolean visit(Object label) {
    //post-condition:   sets visited flag to true, returns previous value
    GraphListVertex v = (GraphListVertex)dict.get(label);
    return v.visit( );
  }
  public boolean visitEdge(Edge e) {
    //precondition:     edge e is contained in graph
    //post-condition:   sets visited flag on edge, returns previous value
    Iterator itr = new GraphListEdgeIterator(dict);
    boolean flag = false;
    Edge edge = null;
    while (itr.hasNext( ) && !flag) {
      edge = (Edge)itr.next( );
      flag = e.equals(edge);
    }
    if (edge != null && flag)
      edge.visit( );
    return flag;
  }
    
  
  public boolean isVisited(Object label) {
    //post-condition:   returns value of visited flag of labeled vertex
    GraphListVertex v = (GraphListVertex)dict.get(label);
    return v.isVisited( );
  }
    
  public boolean isVisitedEdge(Edge e) {
    //post-condition:   returns value of visited flag on edge
    Iterator itr = new GraphListEdgeIterator(dict);
    boolean found = false;
    Edge edge = null;
    while (itr.hasNext( ) && !found) {
      edge = (Edge)itr.next( );
      found = edge.equals(e);
    }
    if (found) {
      return edge.visit( );
    }
    return found;
  }
      
  public void reset( ) {
    //post-condition:   resets all visited flags to false
    Collection vertices = dict.values( );
    Iterator itr = vertices.iterator( );
    while (itr.hasNext( ) ) {
      GraphListVertex v = (GraphListVertex)itr.next( );
      v.reset( );
    }
  }
  public int size( ) {
    //post-condition:   returns the number of vertices in the graph
    return dict.size( );
  }
  public int degree(Object label) {
    //precondition:     label identifies an existing vertex
    //post-condition:   returns the number of vertices adjacent to vertex
    //exception:        returns -1 if vertex not found
    if (dict.containsKey(label) ){
      GraphListVertex v = (GraphListVertex)dict.get(label);
      return v.degree( );
    }
    else
      return -1;    
  }

  public int edgeCount( ) {
    //post-condition:   returns the number of edges in the graph
    //                  VERY TIME CONSUMING ALGORITHM      
    Iterator itr = edges( );
    int count = 0;
    while (itr.hasNext( ) ) {
      itr.next( );
      count++;
    }
    return count;
  }
      
  public Iterator iterator( ) {
    //post-condition: returns an iterator across all vertices in the graph
    Collection vertices = dict.values( );
    Iterator itr = vertices.iterator( );
    return itr;
  }
      
  public Iterator neighbors(Object label) {
    //precondition:     label identifies an existing vertex
    //post-condition:   returns an iterator over the adjacent, out-going
    //                  vertices from the labeled vertex
    Object obj = dict.get(label);
    if (obj != null) { 
      GraphListVertex v = (GraphListVertex)obj;
      return v.adjacentVertices( );
    }
    return null;
  }
  
  public Iterator edges( ) {
    //post-condition:   returns an iterator over edges in the graph
    //                  each edge is visited once.
    Iterator itr = new GraphListEdgeIterator(dict);
    return itr;
  }
  public void clear( ) {
    //post-condition:   removes all vertices (and edges) from the graph
    dict.clear( );
  }
  public boolean isEmpty( ) {
    //post-condition:   returns true if graph contains no vertices
    return dict.isEmpty( );
  }
  public boolean isDirected( ) {
    //post-condition:   returns true if edges of graph are directed
    return directed;
  }
}
  
  
