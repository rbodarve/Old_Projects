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
    Edge e = new Edge(vrtx1, vrtx2, label, true);
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
    Iterator itr = v.adjacentEdges( );
    while (itr.hasNext( ) ) {
      Edge e = (Edge)itr.next( );
      Object v1 = e.here( );
      Object v2 = e.there( );
      ((GraphListVertex)v1).removeEdge(e);
      ((GraphListVertex)v2).removeEdge(e);
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
    Edge e = new Edge(v1.label( ), v2.label( ), null, true);
    v2.removeEdge(e);
    Edge edge = v1.removeEdge(e);
    if (edge == null) return null;
    return edge.label( );
  }
}
  