package es.ucm.unionPOO;

public record Rectangulo(Punto centro, double ancho, double alto) implements Figura {

  @Override
  public double area() {
    return ancho * alto;
  }
}
