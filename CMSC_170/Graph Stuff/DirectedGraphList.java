//package teneyck.graphstuff;
import java.util.*;
public class DirectedGraphList extends GraphList {
  public DirectedGraphList( ) {
    super(true);
  }
  public void addEdge(Object vrtx1, Object vrtx2, Comparable label) {
    //precondition:     vrtx1 and vrtx2 are labels of existing vertices
    //post-condition:   and edge (possibly directed is inserted between
    //                  vrtx1 and vrtx2
    //Assert.pre(dict.containsKey(vrtx1)&&dict.containsKey(vrtx2),"Vertex not found");
    Edge e = new Edge(vrtx1, vrtx2, label, true);
    GraphListVertex v1 = (GraphListVertex)dict.get(vrtx1);
    v1.addEdge(e);
  }

  public Object remove(Object label) {
    //precondition:     label is non-null vertex label
    //post-condition:   vertex with this label is removed, if found
    //Assert.pre(dict.contains(label), "Vertex not found");
    GraphListVertex v = (GraphListVertex)dict.get(label);
    if (v == null) return null;
    //remove incoming edges held by other vertices; v's own outgoing edges
    //are discarded when the vertex is dropped from the dictionary below.
    //edges() iterates over a snapshot, so removeEdge may safely mutate.
    Iterator itr = edges( );
    while (itr.hasNext( ) ) {
      Edge e = (Edge)itr.next( );
      if (e.there( ).equals(label))
        removeEdge(e.here( ), e.there( ));
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
    Edge edge = v1.removeEdge(e);
    if (edge == null) return null;
    return edge.label( );
  }
}
      

  