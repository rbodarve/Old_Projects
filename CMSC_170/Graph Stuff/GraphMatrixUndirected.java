//package teneyck.graphstuff;
import java.util.*;

class GraphMatrixUndirected extends GraphMatrix {
  public GraphMatrixUndirected(int size) {
    //precondition:  size > 0
    //post-condition:  constructs an empty graph that may be expanded 
    //                 to at most size vertices
    super(size, false);
  }
  public void addEdge(Object v1, Object v2, Comparable label) {
    //precondition:   v1 and v2 are labels of existing vertices
    //post-condition:  an edge is inserted between v1 and v2
    GraphMatrixVertex vtx1, vtx2;
    //get vertices
    vtx1 = (GraphMatrixVertex)dict.get(v1);
    vtx2 = (GraphMatrixVertex)dict.get(v2);
    //update matrix with new edge
    Edge e = new Edge(vtx1.label( ), vtx2.label( ), label, false);
    data[vtx1.index( )][vtx2.index( )] = e;
    data[vtx2.index( )][vtx1.index( )] = e;
  }
  public Object removeEdge(Object v1, Object v2) {
    //precondition:   v1 and v2 are labels of exiting vertices
    //post-condition:  edge is removed, its label is returned
    //get indices
    int row = ((GraphMatrixVertex)dict.get(v1)).index( );
    int col = ((GraphMatrixVertex)dict.get(v2)).index( );
    //cache old value
    Edge e = data[row][col];
    //update matrix
    data[row][col] = null;
    data[col][row] = null;
    if (e == null) return null;
    else return e.label( );
  }    
  public Iterator edges( ) {
    //post-condition:   returns an iterator over edges in the graph
    //                  each edge is visited once.
    List list = new LinkedList( );
    for (int row = size - 1; row >= 0; row--)
      for (int col = size -1; col >= row; col--) {
        Edge e = data[row][col];
        if (e != null) list.add(e);
      }
    return list.iterator( );
  }
}
  