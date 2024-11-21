package es.ucm.finaltest;

import java.util.ArrayList;
import java.util.Arrays;

public class Final {
  public static void main(String[] args) {
    final int x;
    if (args.length > 10) {
      x = 3;
    } else {
      x = 5;
    }
    // ERROR: x = 5;
    System.out.printf("Valor de x: %d\n", x);

    final int y = 3;
    // ERROR: y = 4;
    System.out.printf("Valor de y: %d\n", x);

    final int[] arr = new int[] { 1, 3, 10, 23 };
    // ERROR: arr = new int[] { 10, 20, 30 };
    arr[2] *= 10;
    System.out.print("Array arr:");
    Arrays.stream(arr).forEach(z -> System.out.printf(" %d", z));
    System.out.println();

    final var ls = new ArrayList<Integer>();
    // ERROR: ls = Arrays.asList(-4, 1, 4, 7);
    ls.add(10);
    ls.add(20);
    System.out.printf("Lista ls: %s\n", ls);
  }
}