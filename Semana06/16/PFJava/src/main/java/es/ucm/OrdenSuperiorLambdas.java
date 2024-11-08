/*
 * Implementación y uso de la función `map` en Java.
 *
 * Utiliza lambda expresiones en los parámetros de `map`
 */

package es.ucm;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class OrdenSuperiorLambdas {
    public static <T, S> List<S> map(List<T> xs, Function<T, S> f) {
        var result = new ArrayList<S>();
        for (var x : xs) {
            result.add(f.apply(x));
        }
        return result;
    }

    public static void main(String[] args) {
        var l = Arrays.asList(4, 5, 1, 8, 10);
        System.out.printf("Lista original: %s\n", l);
        // var dobles = map(l, (Integer x) -> { return x * 2; });
        // var dobles = map(l, (Integer x) -> x * 2);
        var dobles = map(l, x -> x * 2);
        System.out.printf("Dobles: %s\n", dobles);
        // var doblesMasUno = map(l, (Integer x) -> { return x + 1; });
        var doblesMasUno = map(l, x -> x + 1);
        System.out.printf("Dobles más uno: %s\n", doblesMasUno);
    }
}
