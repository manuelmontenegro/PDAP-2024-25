package es.ucm.unionPOO;

public record Circulo(Punto centro, double radio) implements Figura {
  @Override
  public double area() {
    return Math.PI * radio * radio;
  }
}
