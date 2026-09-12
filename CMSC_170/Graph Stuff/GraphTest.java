import java.util.*;

public class GraphTest {
  public static void main(String[] args) {
    final int SIZE = 16;
    Graph g = new GraphMatrixDirected(SIZE);
//    Graph g = new DirectedGraphList( );
    g.add("Boston");
    g.add("NewYork");
    g.add("Chicago");
    g.add("Philadelphia");
    g.add("Atlanta");
    g.add("Denver");
    g.add("LosAngeles");
    g.add("SanFrancisco");
    g.add("Seattle");
    g.add("Toronto");
    g.addEdge("Boston", "NewYork", new Integer(240));
    g.addEdge("Boston", "Chicago", new Integer(800));
    g.addEdge("Boston", "Toronto", new Integer(450));
    g.addEdge("NewYork", "Chicago", new Integer(840));
    g.addEdge("NewYork", "SanFrancisco", new Integer(3000));
    g.addEdge("NewYork", "Seattle", new Integer(2900));
    g.addEdge("NewYork", "LosAngeles", new Integer(3200));
    g.addEdge("NewYork", "Philadelphia", new Integer(85));
    g.addEdge("NewYork", "Atlanta", new Integer(750));
    g.addEdge("NewYork", "Boston", new Integer(240));
    g.addEdge("Chicago", "NewYork", new Integer(800));
    g.addEdge("Chicago", "Toronto", new Integer(350));
    g.addEdge("Chicago", "LosAngeles", new Integer(2200));
    g.addEdge("Chicago", "SanFrancisco", new Integer(2000));
    g.addEdge("Chicago", "Atlanta", new Integer(1200));
    g.addEdge("Atlanta", "Chicago", new Integer(1200));
    g.addEdge("Atlanta", "Philadelphia", new Integer(720));
    g.addEdge("Atlanta", "LosAngeles", new Integer(2400));
    g.addEdge("Philadelphia", "Atlanta", new Integer(720));
    g.addEdge("Philadelphia", "NewYork", new Integer(80));
    g.addEdge("Philadelphia", "Chicago", new Integer(750));
    g.addEdge("LosAngeles", "Atlanta", new Integer(2400));
    g.addEdge("LosAngeles", "Chicago", new Integer(2200));
    g.addEdge("LosAngeles", "NewYork", new Integer(3200));
    g.addEdge("LosAngeles", "SanFrancisco", new Integer(400));
    g.addEdge("LosAngeles", "Denver", new Integer(900));
    g.addEdge("Denver", "LosAngeles", new Integer(900));
    g.addEdge("Denver", "Chicago", new Integer(1600));
    g.addEdge("SanFrancisco", "LosAngeles", new Integer(400));
    g.addEdge("SanFrancisco", "Seattle", new Integer(800));
    g.addEdge("SanFrancisco", "NewYork", new Integer(3000));
    g.addEdge("SanFrancisco", "Chicago", new Integer(2000));
    g.addEdge("Seattle", "SanFrancisco", new Integer(800));
    g.addEdge("Seattle", "Denver", new Integer(1400));
    g.addEdge("Seattle", "Chicago", new Integer(2100));
    g.addEdge("Toronto", "NewYork", new Integer(650));
    g.addEdge("Toronto", "Chicago", new Integer(350));
    Iterator itr1 = g.iterator( );
    while (itr1.hasNext( ) ) {
      System.out.println(itr1.next( ));
    }
    Iterator itr2 = g.edges( );
    while (itr2.hasNext( ) ) {
      Edge e = (Edge)itr2.next( );
      System.out.println(e);
    }
    System.out.println("number of vertices = " + g.size( ) );
    System.out.println("number of edges = " + g.edgeCount( ));
    g.removeEdge("NewYork", "SanFrancisco");
    g.remove("Denver");
    Iterator itr3 = g.iterator( );
    while (itr3.hasNext( ) ) {
      System.out.println(itr3.next( ));
    }
    Iterator itr4 = g.edges( );
    while (itr4.hasNext( ) ) {
      Edge e = (Edge)itr4.next( );
      System.out.println(e);
    }
    System.out.println("number of vertices = " + g.size( ) );
    System.out.println("number of edges = " + g.edgeCount( ));
    BinaryHeap h = new BinaryHeap( );
    Iterator itr5 = g.edges( );
    while (itr5.hasNext( ) ) {
      h.add((Edge)itr5.next( ) );
    }
    try {
      System.out.println("Ordered listing of edges");
      while (!h.isEmpty( ))
        System.out.println(h.deleteMin( ));
    }catch (Exception e) {System.out.println(e);}
                         
    
  }
}
    
   
    
   
                