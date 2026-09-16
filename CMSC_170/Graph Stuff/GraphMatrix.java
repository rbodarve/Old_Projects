//package teneyck.graphstuff;
import java.util.*;
abstract class GraphMatrix implements Graph {
  protected int size;          // size for graph
  protected Edge data [ ][ ];  // matrix is an array of Edge
  protected Map dict;          //translates labels --> vertices
  protected LinkedList freeList;     //available indices in the matrix
  protected boolean directed;  //true if graph is directed
  
  protected GraphMatrix (int size, boolean dir) {
    this.size = size;    //set minimum size
    directed = dir;
    //construct a size x size matrix
    data = new Edge[size][size];
    //label to index translation table
    dict = new Hashtable(size);
    //put all the indices in the free list
    freeList = new LinkedList( );
    for (int row = 0; row < size; row++)
      freeList.add(new Integer(row) );
  }
  public void add(Object label) {
    //precondition:  label is a non-null label for vertex
    //post-condition:  a vertex with label is added to the graph
    //                 if vertex with label is already in the graph, no action
    //exception:       return -- no action taken generate error message
    if (label == null) { 
      System.out.println("error in GraphMatrix.add()--label is null");
      return;
    }
    if (dict.containsKey(label) ) return;
    //Assert.pre (!freeList.isEmpty( ), "Matrix not full");
    if (freeList.isEmpty( ) ) {
      System.out.println("error in GraphMatrix.add()--Matrix is full");
      return;
    }
    //allocate a free row and column
    int row = ((Integer)freeList.removeFirst( )).intValue( );
    //add vertex to the dictionary
    dict.put(label, new GraphMatrixVertex(label, row));
  }
  public Object remove(Object label) {
    //precondition:    label is non-null vertex label
    //post-condition:  vertex with "equals" label is removed, if found
    //find and extract vertex
    GraphMatrixVertex vert;
    vert = (GraphMatrixVertex)dict.remove(label);
    if (vert == null) return null;
    //remove vertex from matrix
    int index = vert.index( );
    //clear row and column entries
    for (int row = 0; row < size; row++) {
      data[row][index] = null;
      data[index][row] = null;
    }
    freeList.add(new Integer(index) );
    return vert.label( );
  }
  abstract public void addEdge(Object v1, Object v2, Comparable label);
    //precondition:   v1 and v2 are labels of existing vertices
    //post-condition:  an edge is inserted between v1 and v2
  abstract public Object removeEdge(Object v1, Object v2);
    //precondition:   v1 and v2 are labels of exiting vertices
    //post-condition:  edge is removed, its label is returned
    //get indices

  public Object get(Object label) {
    //precondition:     none
    //post-condition:   returns the label of the indicated vertex
    GraphMatrixVertex v = (GraphMatrixVertex)dict.get(label);
    return v.label( );
  }
  public Vertex getVertex(Object label) {
    //precondition:     none
    //post-condition:   returns the Vertex of the indicated label
    GraphMatrixVertex v = (GraphMatrixVertex)dict.get(label);
    return v;
  }
    

  public Edge getEdge(Object vrtx1, Object vrtx2) {
    //precondition:     edge between two vertices exists
    //post-condition:   returns label of edge between the two verices
    //exception:        returns null
    GraphMatrixVertex v1 = (GraphMatrixVertex)dict.get(vrtx1);
    GraphMatrixVertex v2 = (GraphMatrixVertex)dict.get(vrtx2);
    int row = v1.index( );
    int col = v2.index( );
    Edge e = data[row][col];
    return e;
  }
  
  public boolean contains(Object label) {
    //post-condition:   returns true if vertex with this label is present
    return dict.containsKey(label);
  }

  public boolean containsEdge(Object vrtx1, Object vrtx2) {
    //post-condition:   returns true if edge between vertices exists
    GraphMatrixVertex v1 = (GraphMatrixVertex)dict.get(vrtx1);
    GraphMatrixVertex v2 = (GraphMatrixVertex)dict.get(vrtx2);
    int row = v1.index( );
    int col = v2.index( );
    Edge e = data[row][col];
    return e != null;
  }        
      
  public boolean visit(Object label) {
    //post-condition:   sets visited flag to true, returns previous value
    Vertex v = (Vertex)dict.get(label);
    return v.visit( );
  }
  public boolean visitEdge(Edge e) {
    //precondition:     edge e is contained in graph
    //post-condition:   sets visited flag on edge, returns previous value
    Iterator itr = edges( );
    boolean flag = false;
    Edge edge = null;
    while (itr.hasNext( ) && !flag) {
      edge = (Edge)itr.next( );
      flag = e.equals(edge);
    }
    if (edge != null && flag)
      edge.visit( );
    return flag;
  }    
  
  public boolean isVisited(Object label) {
    //post-condition:   returns value of visited flag of labeled vertex
    Vertex v = (Vertex)dict.get(label);
    return v.isVisited( );
  }
    
  public boolean isVisitedEdge(Edge e) {
    //post-condition:   returns value of visited flag on edge
    Iterator itr = edges( );
    boolean found = false;
    Edge edge = null;
    while (itr.hasNext( ) && !found) {
      edge = (Edge)itr.next( );
      found = edge.equals(e);
    }
    if (found) {
      return edge.visit( );
    }
    return found;
  }
      
  public void reset( ) {
    //post-condition:   resets all visited flags to false
    Collection vertices = dict.values( );
    Iterator itr = vertices.iterator( );
    while (itr.hasNext( ) ) {
      Vertex v = (Vertex)itr.next( );
      v.reset( );
    }
  }
  public int size( ) {
    //post-condition:   returns the number of vertices in the graph
    return dict.size( );
  }
  public int degree(Object label) {
    //precondition:     label identifies an existing vertex
    //post-condition:   returns the number of vertices adjacent to vertex
    //exception:        returns -1 if vertex not found
    if (dict.containsKey(label) ){
      GraphMatrixVertex v = (GraphMatrixVertex)dict.get(label);
      int count = 0;
      int row = v.index( );
      if (directed){
        for (int i = 0; i < size; i++)
          if (i != row && data[row][i] != null) count++;  //out degree
        for (int j = 0; j < size; j++)
          if (j != row && data[j][row] != null) count++; //in degree
      }
      else if (!directed) {
        for (int i = 0; i < size; i++)
          if (i != row && data[row][i] != null) count++;
      }
      return count;
    }
    else
      return -1;    
  }

  public int edgeCount( ) {
    //post-condition:   returns the number of edges in the graph
    //                  VERY TIME CONSUMING ALGORITHM      
    Iterator itr = edges( );
    int count = 0;
    while (itr.hasNext( ) ) {
      itr.next( );
      count++;
    }
    return count;
  }
      
  public Iterator iterator( ) {
    //post-condition: returns an iterator across all vertices in the graph
    return dict.keySet( ).iterator( );
  }
      
  public Iterator neighbors(Object label) {
    //precondition:     label identifies an existing vertex
    //post-condition:   returns an iterator over the adjacent, out-going
    //                  vertices from the labeled vertex
    GraphMatrixVertex v = (GraphMatrixVertex)dict.get(label);
    List list = new LinkedList( );
    for (int row = size-1; row >= 0; row--) {
      Edge e = data[v.index( )][row];
      if (e != null) {
        if (e.here( ).equals(v.label( ) ) )
          list.add(e.there( ) );
        else list.add(e.here( ) );
      }
    }
    return list.iterator( );
  }
  
  abstract public Iterator edges( );
    //post-condition:   returns an iterator over edges in the graph
    //                  each edge is visited once.
    
  public void clear( ) {
    //post-condition:   removes all vertices (and edges) from the graph
    dict.clear( );
  }
  public boolean isEmpty( ) {
    //post-condition:   returns true if graph contains no vertices
    return dict.isEmpty( );
  }
  public boolean isDirected( ) {
    //post-condition:   returns true if edges of graph are directed
    return directed;
  }
}

  