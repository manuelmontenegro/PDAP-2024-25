/*
 * Uso de la clase `Stream` para recorrer secuencias de manera perezosa.
 */
package es.ucm;

import java.util.Arrays;
import java.util.stream.Stream;



public class Streams {
  record Pair<T, S>(T first, S second) { }

  public static void main(String[] args) {
    var nums = Arrays.asList(10, 3, -2, 5, 1, 9, 10);
    int result = nums.stream()
            .filter(x -> x >= 0)
            .map(x -> x * 2)
            .reduce(0, Integer::sum);
    System.out.println(result);



    Stream.iterate(new Pair<>(0, 1), p -> new Pair<>(p.second(), p.first() + p.second()))
            .map(Pair::first)
            .limit(10)
            .forEach(System.out::println);
  }
}
