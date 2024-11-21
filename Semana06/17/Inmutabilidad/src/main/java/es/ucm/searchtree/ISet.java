package es.ucm.searchtree;

record Empty() implements ISet { }
record Node(int elem, ISet left, ISet right) implements ISet { }

record RemoveLowestResult(int lowest, ISet result) { }

public sealed interface ISet permits Empty, Node {
  default boolean isEmpty() {
    return this instanceof Empty;
  }

  default boolean contains(int x) {
    return switch (this) {
      case Empty _ -> false;
      case Node v when v.elem() == x -> true;
      case Node v when x < v.elem() -> v.left().contains(x);
      case Node v -> v.right().contains(x);
    };
  }

  default ISet add(int x) {
    return switch (this) {
      case Empty _ -> new Node(x, new Empty(), new Empty());
      case Node v when v.elem() == x -> this;
      case Node v when x < v.elem() ->
        new Node(v.elem(), v.left().add(x), v.right());
      case Node v ->
        new Node(v.elem(), v.left(), v.right().add(x));
    };
  }

  default ISet remove(int x) {
    return switch (this) {
      case Empty _ -> this;
      case Node v when v.elem() == x && v.right().isEmpty() -> v.left();
      case Node v when v.elem() == x && v.left().isEmpty() -> v.right();
      case Node v when v.elem() == x  -> {
        var rightResult = v.right().removeLowest();
        yield new Node(rightResult.lowest(), v.left(), rightResult.result());
      }

      case Node v when x < v.elem() ->
              new Node(v.elem(), v.left().remove(x), v.right());
      case Node v ->
              new Node(v.elem(), v.left(), v.right().remove(x));
    };
  }


  private RemoveLowestResult removeLowest() {
    return switch (this) {
      case Empty _ -> throw new RuntimeException("RemoveLowest en árbol vacío");
      case Node(var elem, Empty(), var r) -> new RemoveLowestResult(elem, r);
      case Node(var elem, var l, var r) -> {
        var leftResult = l.removeLowest();
        yield new RemoveLowestResult(leftResult.lowest(), new Node(elem, leftResult.result(), r));
      }
    };
  }



}
