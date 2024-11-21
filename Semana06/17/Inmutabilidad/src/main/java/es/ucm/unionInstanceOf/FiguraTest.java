package es.ucm.unionInstanceOf;

import java.util.stream.Stream;

public class FiguraTest {
  public static void main(String[] args) {

    var f1 = new Rectangulo(new Punto(0, 0), 3, 5);
    var f2 = new Circulo(new Punto(5, 5), 10);
    var f3 = new Segmento(new Punto(10, 10), new Punto(20, 20));

    var sumaAreas = Stream.of(f1, f2, f3).mapToDouble(Figura::area).sum();
    System.out.println(sumaAreas);
  }
}

