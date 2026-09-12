//package teneyck.graphstuff
class GraphMatrixVertex extends Vertex {
  protected int index;
  public GraphMatrixVertex(Object key, int index) {
    //post-condition:   constructs and initializes a new vertex, not
    //                  adjacent to any other
    super(key);
    this.index = index;
  }
  public int index( ) {
    return index;
  }
  public String toString( ) {
    return super.toString( ) + " ," + index;
  }

}