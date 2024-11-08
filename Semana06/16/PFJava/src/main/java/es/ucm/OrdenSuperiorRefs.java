/*
 * Implementación y uso de la función `map` en Java.
 *
 * Utiliza referencias a métodos en los parámetros de `map`
 */

package es.ucm;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.io.File;
import java.util.function.Predicate;


public class OrdenSuperiorRefs {
    public static <T, S> List<S> map(List<T> xs, Function<T, S> f) {
        var result = new ArrayList<S>();
        for (var x : xs) {
            result.add(f.apply(x));
        }
        return result;
    }

    static Integer multiplicarDos(Integer x) {
        return x * 2;
    }

    static Integer sumarUno(Integer x) {
        return x + 1;
    }

    public static void main(String[] args) {
        var l = Arrays.asList(4, 5, 1, 8, 10);
        System.out.printf("Lista original: %s\n", l);
        // var dobles = map(l, (Integer x) -> { return x * 2; });
        // var dobles = map(l, (Integer x) -> x * 2);
        var dobles = map(l, OrdenSuperiorRefs::multiplicarDos);
        System.out.printf("Dobles: %s\n", dobles);
        // var doblesMasUno = map(l, (Integer x) -> { return x + 1; });
        var doblesMasUno = map(l, OrdenSuperiorRefs::sumarUno);
        System.out.printf("Dobles más uno: %s\n", doblesMasUno);

        var nombres = Arrays.asList("clara", "ricardo", "manuel");
        var mayusculas = map(nombres, String::toUpperCase);
        System.out.printf("Mayúsculas: %s\n", mayusculas);

        var nombresFicheros = Arrays.asList("dir1/hola.txt", "dir2/adios.java");
        var objetosFile = map(nombresFicheros, File::new);
        System.out.println(map(objetosFile, File::getParent));

        var xs = Arrays.asList("a", "b", "c");
        xs.forEach(System.out::println);

    }
}
