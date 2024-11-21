package es.ucm.unionInstanceOf;

public interface Figura {
  static double area(Figura f) {
    if (f instanceof Rectangulo r) {
      return r.alto() * r.ancho();
    } else if (f instanceof Circulo c) {
      return Math.PI * c.radio() * c.radio();
    } else {
      return 0;
    }
  }
}
