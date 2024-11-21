package es.ucm.optional;

import java.util.Optional;

public class OptionalIsPresent {
  interface Map<K, V> {
    Optional<V> get(K k);
  }

  private static void ejemplo(Map<Integer, String> dicc) {
    var optStr = dicc.get(3);
    int longitud = optStr.isPresent() ? optStr.get().length() : 0;
  }
}
