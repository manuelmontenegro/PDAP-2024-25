package es.ucm.unionSwitch;

public sealed interface Figura permits Rectangulo, Circulo, Segmento {
  static double area(Figura f) {
    return switch (f) {
      case Rectangulo(var _, var ancho, var alto) -> ancho * alto;
      case Circulo(var _, var radio) -> Math.PI * radio * radio;
      case Segmento(var _, var _) -> 0;
    };

    /*
    // Versión alternativa
    return switch(f) {
      case Rectangulo r -> r.ancho() * r.alto();
      case Circulo c -> Math.PI * c.radio() * c.radio();
      case Segmento _ -> 0;
    };
    */
  }

  static boolean esHorizontal(Figura f) {
    return switch (f) {
      case Segmento(Punto(var _, var y1), Punto(var _, var y2)) when y1 == y2 -> true;
      default -> false;
    };
  }

}
