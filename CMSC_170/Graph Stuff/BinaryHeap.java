//package teneyck.graphstuff;
import java.util.*;  //ArrayList, NoSuchElementException
public class BinaryHeap {
  private List heap;   //0-based array representation of a min-heap
  public BinaryHeap( ) {
    //post-condition:   constructs an empty heap
    heap = new ArrayList( );
  }
  public boolean isEmpty( ) {
    //post-condition:   returns true if the heap contains no elements
    return heap.isEmpty( );
  }
  public int size( ) {
    //post-condition:   returns the number of elements in the heap
    return heap.size( );
  }
  public void add(Comparable value) {
    //post-condition:   value is inserted, heap order restored
    heap.add(value);
    int i = heap.size( ) - 1;
    while (i > 0) {
      int parent = (i - 1) / 2;
      Comparable p = (Comparable)heap.get(parent);
      if (p.compareTo(heap.get(i)) <= 0) break;
      swap(i, parent);
      i = parent;
    }
  }
  public Comparable deleteMin( ) throws Exception {
    //precondition:     heap is non-empty
    //post-condition:   removes and returns the minimum element
    //exception:        throws if the heap is empty
    if (heap.isEmpty( ))
      throw new NoSuchElementException("heap is empty");
    Comparable min = (Comparable)heap.get(0);
    Comparable last = (Comparable)heap.remove(heap.size( ) - 1);
    if (!heap.isEmpty( )) {
      heap.set(0, last);
      int i = 0;
      int n = heap.size( );
      while (true) {
        int left = 2 * i + 1, right = 2 * i + 2, smallest = i;
        if (left < n && ((Comparable)heap.get(left)).compareTo(heap.get(smallest)) < 0)
          smallest = left;
        if (right < n && ((Comparable)heap.get(right)).compareTo(heap.get(smallest)) < 0)
          smallest = right;
        if (smallest == i) break;
        swap(i, smallest);
        i = smallest;
      }
    }
    return min;
  }
  private void swap(int a, int b) {
    Object tmp = heap.get(a);
    heap.set(a, heap.get(b));
    heap.set(b, tmp);
  }
}
