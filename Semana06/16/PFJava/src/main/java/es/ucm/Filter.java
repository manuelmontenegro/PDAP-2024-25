/*
 *  Implementación y uso de la función `filter` en Java
 */

package es.ucm;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;

public class Filter {
  public static <T> List<T> filter(List<T> xs, Predicate<T> f) {
    var result = new ArrayList<T>();
    for (var x : xs) {
      if (f.test(x)) {
        result.add(x);
      }
    }
    return result;
  }

  public static void main(String[] args) {
    var l = filter(Arrays.asList(6, 1, 3, -1, 5, 0, -4), x -> x <= 0);
    System.out.println(l);
  }
}
