//package teneyck.graphstuff;
import java.util.*;

class UndirectedGraphList extends GraphList {
  public UndirectedGraphList( ) {
    super(false);
  }
  public void addEdge(Object vrtx1, Object vrtx2, Comparable label) {
    //precondition:     vrtx1 and vrtx2 are labels of existing vertices
    //post-condition:   and edge (possibly directed is inserted between
    //                  vrtx1 and vrtx2
    //Assert.pre(dict.containsKey(vrtx1)&&dict.containsKey(vrtx2),"Vertex not found");
    Edge e = new Edge(vrtx1, vrtx2, label, false);
    GraphListVertex v1 = (GraphListVertex)dict.get(vrtx1);
    v1.addEdge(e);
    GraphListVertex v2 = (GraphListVertex)dict.get(vrtx2);
    v2.addEdge(e);
  }

  public Object remove(Object label) {
    //precondition:     label is non-null vertex label
    //post-condition:   vertex with this label is removed, if found
    //Assert.pre(dict.contains(label), "Vertex not found");
    GraphListVertex v = (GraphListVertex)dict.get(label);
    if (v == null) return null;
    //snapshot incident edges so removeEdge may safely mutate the lists.
    //each undirected edge is shared with the neighbor's adjacency list;
    //remove it there. v's own list is discarded with the vertex below.
    List incident = new LinkedList( );
    Iterator itr = v.adjacentEdges( );
    while (itr.hasNext( ) )
      incident.add(itr.next( ));
    Iterator it2 = incident.iterator( );
    while (it2.hasNext( ) ) {
      Edge e = (Edge)it2.next( );
      Object other = e.here( ).equals(label) ? e.there( ) : e.here( );
      GraphListVertex ov = (GraphListVertex)dict.get(other);
      if (ov != null) ov.removeEdge(e);
    }
    dict.remove(label);
    return v.label( );
  }    

  public Object removeEdge(Object vrtx1, Object vrtx2) {
    //precondition:     vertex1 and vertex2 are existing vertex labels
    //post-condition:   edge is removed and its label returned
    //Assert.pre(dict.containsKey(vrtx1)&&dict.containsKey(vrtx2),"Vertex not found");
    GraphListVertex v1 = (GraphListVertex)dict.get(vrtx1);
    GraphListVertex v2 = (GraphListVertex)dict.get(vrtx2);
    Edge e = new Edge(v1.label( ), v2.label( ), null, false);
    v2.removeEdge(e);
    Edge edge = v1.removeEdge(e);
    if (edge == null) return null;
    return edge.label( );
  }
}
  