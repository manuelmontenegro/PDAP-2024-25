package es.ucm.optional;

import java.util.Map;
import java.util.Optional;
import java.util.TreeSet;

public class OptionalMap {
  private static int ejemplo(Map<Integer, TreeSet<String>> dicc) {
    var optSet = Optional.ofNullable(dicc.get(3));
    if (optSet.isPresent()) {
      var optStr = Optional.ofNullable(optSet.get().pollFirst());
      return optStr.isPresent() ? optStr.get().length() : 0;
    } else {
      return 0;
    }
  }

  private static int ejemploSimple(Map<Integer, TreeSet<String>> dicc) {
    return Optional.ofNullable(dicc.get(3))
            .map(TreeSet<String>::pollFirst)
            .map(String::length)
            .orElse(0);
  }
}