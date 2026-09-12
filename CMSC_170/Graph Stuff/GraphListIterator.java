//package teneyck.graphstuff;
import java.util.*; //Iterator
class GraphListIterator implements Iterator {
  private Iterator iter;
  private Object vertex;
  public GraphListIterator(Iterator itr, Object label) {
    iter = itr;
    vertex = label;
  }
  public boolean hasNext( ) {
    return iter.hasNext( );
  }
  public Object next( ) {
    //post-condition:   returns the label of the next adjacent vertex
    //                  increments the iterator to the next Object
    Edge edge = (Edge)iter.next( );
    if (!vertex.equals(edge.here( )) )
      return edge.here( );
    else
      return edge.there( );
  }
  public void remove( ) {
    iter.remove( );
  }
}