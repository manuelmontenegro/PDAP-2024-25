package es.ucm.records;

import java.util.stream.Stream;

public record Fecha(int dia, int mes, int anyo) {

  public Fecha {
    if (mes < 1 || mes > 12) {
      throw new RuntimeException("Mes no válido: " + mes);
    }
  }


  public Fecha withDia(int dia) {
    return new Fecha(dia, this.mes, this.anyo);
  }

  public Fecha withMes(int mes) {
    return new Fecha(this.dia, mes, this.anyo);
  }

  public Fecha withAnyo(int anyo) {
    return new Fecha(this.dia, this.mes, anyo);
  }

  public Fecha(int anyo) {
    this(0, 0, anyo);
  }

  @Override
  public String toString() {
    return String.format("%02d/%02d/%04d", this.dia, this.mes, this.anyo);
  }
}
