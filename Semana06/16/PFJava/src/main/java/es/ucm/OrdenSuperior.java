/*
 * Implementación y uso de la función `map` en Java.
 *
 * Utiliza instancias de clases no anónimas como parámetros de `map`
 */

package es.ucm;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class OrdenSuperior {
  public static <T, S> List<S> map(List<T> xs, Function<T, S> f) {
    var result = new ArrayList<S>();
    for (var x : xs) {
      result.add(f.apply(x));
    }
    return result;
  }

  static class MultiplicarPorDos implements Function<Integer, Integer> {
    @Override
    public Integer apply(Integer x) {
      return x * 2;
    }
  }

  static class SumarUno implements Function<Integer, Integer> {
    @Override
    public Integer apply(Integer x) {
      return x + 1;
    }
  }

  public static void main(String[] args) {
    var l = Arrays.asList(4, 5, 1, 8, 10);
    System.out.printf("Lista original: %s\n", l);
    var dobles = map(l, new MultiplicarPorDos());
    System.out.printf("Dobles: %s\n", dobles);
    var doblesMasUno = map(l, new SumarUno());
    System.out.printf("Dobles más uno: %s\n", doblesMasUno);
  }
}
