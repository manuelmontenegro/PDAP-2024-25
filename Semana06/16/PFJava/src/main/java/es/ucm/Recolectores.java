/*
 * Uso de `Collectors` para almacenar los elementos de una lista perezosa.
 */

package es.ucm;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Recolectores {
  public static void main(String[] args) {
    List<Integer> result =
            Stream.iterate(1, x -> x * 2)
                    .limit(15)
                    .collect(ArrayList::new,
                            ArrayList::add,
                            ArrayList::addAll);
    System.out.println(result);

    String str =
            Stream.of("Marta", "Gerardo", "Diana")
                    .map(String::toLowerCase)
                    .map(s -> s + ".txt")
                    .collect(Collectors.joining(" / "));

    System.out.println(str);


    Map<Integer, List<String>> m =
      Stream.of("Marta", "Gerardo", "Diana", "Carlos", "David", "Águeda")
              .collect(Collectors.groupingBy(String::length));

    System.out.println(m);

  }
}
