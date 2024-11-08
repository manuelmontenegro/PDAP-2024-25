/*
 *  Implementación y uso de la función `zipWith` en Java
 */

package es.ucm;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.BiFunction;

public class ZipWith {
  public static <T, S, R> List<R> zipWith(List<T> xs, List<S> ys, BiFunction<T, S, R> f) {
    var result = new ArrayList<R>();
    var itXs = xs.iterator();
    var itYs = ys.iterator();
    while (itXs.hasNext() && itYs.hasNext()) {
      result.add(f.apply(itXs.next(), itYs.next()));
    }
    return result;
  }

  public static void main(String[] args) {
    var xs = Arrays.asList(5, 2, 1, 7, 10);
    var ys = Arrays.asList(10, 9, 3, 5, 2);
    System.out.println(zipWith(xs, ys, Integer::sum));
  }
}
