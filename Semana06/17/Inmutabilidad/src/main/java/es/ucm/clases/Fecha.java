package es.ucm.clases;

public class Fecha {
  private final int dia;
  private final int mes;
  private final int anyo;

  public Fecha(int dia, int mes, int anyo) {
    this.dia = dia;
    this.mes = mes;
    this.anyo = anyo;
  }

  public int getDia() {
    return dia;
  }

  public int getMes() {
    return mes;
  }

  public int getAnyo() {
    return anyo;
  }
}
