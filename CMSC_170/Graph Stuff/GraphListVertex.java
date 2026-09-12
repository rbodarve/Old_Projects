//package teneyck.graphstuff
import java.util.*;  //LinkedList
class GraphListVertex extends Vertex {
  protected List adjacencies;
  public GraphListVertex(Object key) {
    //post-condition:   constructs and initializes a new vertex, not
    //                  adjacent to any other
    super(key);
    adjacencies = new LinkedList( );
  }
  public void addEdge(Edge e) {
    //precondition:     e is an edge that emanates from this vertex
    //post-condition:   edge e is added to this verex's adjacency list
    if (vertex.equals(e.here( ) ) || vertex.equals(e.there( )) ) {
      if (!containsEdge(e) )
        adjacencies.add(e);
    }
  }
  public boolean containsEdge(Edge e) {
    //post-condition:   returns true if e is in this vetex's adjacency list
    return adjacencies.contains(e);
  }
  public Edge removeEdge(Edge e) {
    //precondition:     Edge e is adjacent to this vertex
    //post-condition:   removes from adjacency list and returns edge e
    //exception:        returns null
    Edge gone = null;
    if (adjacencies.remove(e) )
      gone = e;
    return gone;
  }
  public Edge getEdge(Edge e) {
    //post-condition:  returns the edge that "equals" e or null
    Iterator edges = adjacencies.iterator( );
    while (edges.hasNext( ) ) {
      Edge adjE = (Edge)edges.next( );
      if (e.equals(adjE) )
        return adjE;
    }
    return null;
  }
  public int degree( ) {
    //post-condition:   returns the degree of this vertex
    return adjacencies.size( );
  }
  public Iterator adjacentVertices( ) {
    //post-condition:   returns iterator over adjacent verices
    return new GraphListIterator(adjacentEdges( ), label( ) );
  }
  public Iterator adjacentEdges( ) {
    //post-condition:   returns an iterator over adjacent edges
    return adjacencies.iterator( );
  }
}