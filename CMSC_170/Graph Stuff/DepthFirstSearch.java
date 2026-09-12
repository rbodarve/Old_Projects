import java.util.*;
public class DepthFirstSearch {
  private static final int WHITE = 0;
  private static final int GRAY = 1;
  private static final int BLACK = 2;
  private static int [ ] mark;
  private static int [ ] finish;
  private static int [ ] color;
  private static Object [ ] pred;
  private static int count;
  private static Graph g;
  
  public static void main (String[ ] args) {
    //g = new DirectedGraphList( );
    g = new GraphMatrixDirected(10);
    g.add(new Integer(1) );
    g.add(new Integer(2) );
    g.add(new Integer(3) );
    g.add(new Integer(4) );
    g.add(new Integer(5) );
    g.add(new Integer(6) );
    g.add(new Integer(7) );
    g.add(new Integer(8) );
    g.add(new Integer(9) );
    g.add(new Integer(10) );
    g.addEdge(new Integer(1), new Integer(2),"Edge from 1 to 2");
    g.addEdge(new Integer(1), new Integer(3),"Edge from 1 to 3");
    g.addEdge(new Integer(1), new Integer(5),"Edge from 1 to 5");
    g.addEdge(new Integer(3), new Integer(4),"Edge from 3 to 4");
    g.addEdge(new Integer(4), new Integer(5),"Edge from 4 to 5");
    g.addEdge(new Integer(5), new Integer(3),"Edge from 5 to 3");
    g.addEdge(new Integer(5), new Integer(6),"Edge from 5 to 6");
    g.addEdge(new Integer(5), new Integer(7),"Edge from 5 to 7");
    g.addEdge(new Integer(7), new Integer(6),"Edge from 7 to 6");
    g.addEdge(new Integer(8), new Integer(4),"Edge from 8 to 4");
    g.addEdge(new Integer(8), new Integer(9),"Edge from 8 to 9");
    g.addEdge(new Integer(8), new Integer(10),"Edge from 8 to 10");
    g.addEdge(new Integer(9), new Integer(10),"Edge from 9 to 10");
    mark = new int[g.size( ) + 1];
    finish = new int[g.size( ) + 1];
    color = new int[g.size( ) + 1];
    pred = new Object[g.size( ) + 1];
    for (int i= 1; i <= g.size( ); i++) {
      color[i] = WHITE;
      mark[i] = 0;
      finish[i] = 0;
      pred[i] = null;
    }
    count = 0;
    for (int j = 1; j <= g.size( ); j++) {
      Vertex v = g.getVertex(new Integer(j) );
      if(!v.isVisited( ) )
        dfs(v);
    }
  }
  private static void dfs (Vertex v) {
    v.visit( );
    Integer val = (Integer)v.label( );
    color[val.intValue( )] = GRAY;
    mark[val.intValue( )] = ++count;
    Iterator itr = g.neighbors(v.label( ));
    while (itr.hasNext( ) ) {
      Object obj = itr.next( );
      Vertex w = g.getVertex(obj);
      if (!w.isVisited( ) ) {
        System.out.println(g.getEdge(v.label( ), w.label( ))+" is a tree edge");
        pred[((Integer)w.label( )).intValue( )] = v;
        dfs(w);
      }
      else if (color[((Integer)w.label( )).intValue( )] == GRAY)
        System.out.println(g.getEdge(v.label( ), w.label( ))+" is a back edge");
      else if (finish[((Integer)w.label( )).intValue( )] > mark[val.intValue( )])
        System.out.println(g.getEdge(v.label( ), w.label( ))+" is a forward edge");
      else
        System.out.println(g.getEdge(v.label( ), w.label( ))+" is a cross edge");
    }
    finish[val.intValue( )] = ++count;
    color[val.intValue( )] = BLACK;
  }
}
        
    
    
    