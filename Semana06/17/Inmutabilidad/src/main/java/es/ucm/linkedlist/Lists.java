package es.ucm.linkedlist;

import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Function;

public class Lists {
  public static void main(String[] args) {
    var xs = IList.of(2, 0, 4, -6, 3);
    var ys = IList.of(1, 7, 5);

    var zs = xs.append(ys);

    System.out.println(zs.asString());

    var ws = zs.map(x -> x * 2);

    System.out.println(ws.asString());
  }

}
