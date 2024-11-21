package es.ucm.unionPOO;

public record Segmento(Punto origen, Punto destino) implements Figura {
  @Override
  public double area() {
    return 0;
  }
}
