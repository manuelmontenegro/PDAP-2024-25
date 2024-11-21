package es.ucm.immutablecollections;

import org.javimmutable.collections.IDeques;

public class DequeTest {
  public static void main(String[] args) {
    var d1 = IDeques.of(1, 5, 10);
    var d2 = d1.insert(20).insertFirst(-3);
    System.out.println("Tras las inserciones:");
    System.out.printf("d1 = %s\n", d1);
    System.out.printf("d2 = %s\n", d2);
    var d3 = d2.deleteFirst().deleteFirst().deleteLast();
    System.out.println("Tras los borrados:");
    System.out.printf("d2 = %s\n", d2);
    System.out.printf("d3 = %s\n", d3);
  }
}
