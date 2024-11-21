package es.ucm.immutablecollections;

import org.javimmutable.collections.IList;
import org.javimmutable.collections.ILists;

public class ListTest {
  public static void main(String[] args) {
    var i1 = ILists.of(1, 30, 5, 9);
    var i2 = i1.assign(1, 20);
    System.out.printf("i1 = %s\n", i1);
    System.out.printf("i2 = %s\n", i2);

    var i3 = i2.delete(2);
    System.out.printf("i2 = %s\n", i2);
    System.out.printf("i3 = %s\n", i3);
  }
}
