package es.ucm.linkedlist;

import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Function;

record Empty<T>() implements IList<T> { }
record Cons<T>(T head, IList<T> tail) implements IList<T> { }

public sealed interface IList<T> permits Empty, Cons {
  default boolean isEmpty() {
    return this instanceof Empty<T>;
  }

  default int length() {
    return this.reduce(0, (x, l) -> l + 1);
  }

  default T at(int n) {
    return switch (this) {
      case Empty<T> e -> throw new IndexOutOfBoundsException();
      case Cons<T> v when n < 0 -> throw new IndexOutOfBoundsException();
      case Cons<T> v when n == 0 -> v.head();
      case Cons<T> v -> v.tail().at(n - 1);
    };
  }

  default <U> IList<U> map(Function<? super T, ? extends U> f) {
    return switch (this) {
      case Empty<T> v -> new Empty<>();
      case Cons<T> v -> new Cons<>(f.apply(v.head()), v.tail().map(f));
    };
  }

  default void forEach(Consumer<? super T> f) {
    if (this instanceof Cons<T>(T head, IList<T> tail)) {
      f.accept(head);
      tail.forEach(f);
    }
  }

  default <R> R reduce(R ini, BiFunction<? super T, ? super R, ? extends R> f) {
    return switch (this) {
      case Empty<T> v -> ini;
      case Cons<T> v -> v.tail().reduce(f.apply(v.head(), ini), f);
    };
  }

  default <R>  R reduceRight(R ini, BiFunction<? super T, ? super R, ? extends R> f) {
    return switch (this) {
      case Empty<T> v -> ini;
      case Cons<T> v -> f.apply(v.head(), v.tail().reduceRight(ini, f));
    };
  }

  default IList<T> append(IList<T> other) {
    return this.reduceRight(other, Cons<T>::new);
  }

  default String asString() {
    return switch (this) {
      case Empty<T> e -> "[]";
      case Cons<T> v -> {
        var b = new StringBuffer();
        b.append("[");
        b.append(v.head().toString());
        v.tail().forEach(x -> { b.append(", "); b.append(x.toString()); });
        b.append("]");
        yield b.toString();
      }
    };
  }

  @SafeVarargs
  static <T> IList<T> of(T... elems) {
    IList<T> result = new Empty<>();
    for (int i = elems.length - 1; i >= 0; i--) {
      result = new Cons<>(elems[i], result);
    }
    return result;
  }

}

