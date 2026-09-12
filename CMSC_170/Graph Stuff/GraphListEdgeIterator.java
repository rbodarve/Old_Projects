//package teneyck.graphstuff;
import java.util.*;  //Container, Iterator, LinkedList;
class GraphListEdgeIterator implements Iterator{
  protected Iterator edges;
  public GraphListEdgeIterator(Map dict) {
    //constructs a new iterator across edges of vertices within dictionary
    List eList = new LinkedList( );
    Iterator dictIterator = dict.values( ).iterator( );
    while (dictIterator.hasNext( ) ) {
      GraphListVertex v = (GraphListVertex)dictIterator.next( );
      Iterator vitr = v.adjacentEdges( );
      while (vitr.hasNext( ) ){
        Edge e = (Edge)vitr.next( );
        if (v.label( ).equals(e.here( )) ) 
          eList.add(e);
      }
    }
    edges = eList.iterator( );
  }
  public boolean hasNext( ) {
    return edges.hasNext( );
  }
  public Object next( ) {
    return edges.next( );
  }
  public void remove( ) {
    edges.remove( );
  }
}
  