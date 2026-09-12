//package teneyck.graphstuff;
class Vertex {
  protected Object vertex;
  protected boolean visited;
  public Vertex(Object label) {
    //constructs an unvisited vertex with label
    vertex = label;
    visited = false;
  }
  public Object label( ) {
    //post-condition:   returns label associated with vertex
    return vertex;
  }
  public boolean visit( ) {
    //post-condition:   returns previous value of visited and sets it to true
    boolean flag = visited;
    visited = true;
    return flag;
  }
  public boolean isVisited( ) {
    return visited;
  }
  public void reset( ) {
    //post-condition:   marks vertex unvisited
    visited = false;
  }
  public boolean equals(Object vrtx) {
    //post-condition:   returns true if this label "equals" vrtx label
    return vertex.equals(vrtx);
  }
  public String toString( ) {
    return vertex.toString( );
  }
}
