package es.ucm.immutablecollections;

import org.javimmutable.collections.ISets;

public class SetTest {
  public static void main(String[] args) {
    var s1 = ISets.sorted(10, 5, 3, 20);
    var s2 = s1.insert(4).delete(20);
    System.out.printf("s1 = %s\ns2 = %s\n", s1, s2);

    System.out.println(s1.contains(20));
    System.out.println(s2.contains(20));
  }
}
