//package teneyck.graphstuff;
public class Edge implements Comparable{
  protected Object vertex1, vertex2;
  protected Comparable edgeLabel;
  protected boolean directed, visited;
  
  public Edge(Object vrtx1, Object vrtx2, Comparable label, boolean directed) {
    //constructor
    vertex1 = vrtx1;
    vertex2 = vrtx2;
    edgeLabel = label;
    this.directed = directed;
    visited = false;
  }
  public Object here( ) {
    //post-condition:   returns first vertex in the edge
    return vertex1;
  }
  public Object there( ) {
    //post-condition:   returns first vertex in the edge
    return vertex2;
  }
  public void setLabel(Comparable label) {
    //post-condition:   edgeLabel is set
    edgeLabel = label;
  }
  public Object label( ) {
    //post-condition:   edgeLabel is returned
    return edgeLabel;
  }
  public boolean visit( ) {
    //post-condition:   edge is marked visited, previous value returned
    boolean flag = visited;
    visited = true;
    return flag;
  }
  public boolean isVisited( ) {
    return visited;
  }
  public boolean isDirected( ) {
    return directed;
  }
  public void reset( ) {
    //post-condition:   visited flag is reset to false
    visited = false;
  }
  public boolean equals(Object obj) {
    //post-condition:   returns true if edge connects same vertices,
    //                  has same label, and has same directed value
    Edge other = (Edge)obj;
    boolean flag = vertex1.equals(other.vertex1) && vertex2.equals(other.vertex2);
    //flag = flag && edgeLabel.equals(other.edgeLabel);
    //flag = flag && directed == other.directed;
    return flag;
  }
  public String toString( ) {
    //post-condition:   returns the label and identity of two vertices
    String str = "Edge: " + edgeLabel +"\nFrom vertex:  " + vertex1;
    str += "  To vertex:  " + vertex2 + "\n";
    return str;
  }
  public int compareTo(Object obj) {
    Edge other = (Edge)obj;
    return this.edgeLabel.compareTo(other.edgeLabel);
  }
}
    
  
    