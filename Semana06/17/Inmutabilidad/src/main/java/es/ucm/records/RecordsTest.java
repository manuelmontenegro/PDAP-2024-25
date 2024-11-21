package es.ucm.records;

import java.util.stream.Stream;

public class RecordsTest {
  public static void main(String[] args) {
    var f1 = new Fecha(15, 3, 1979);
    var f2 = new Fecha(15, 3, 1979);
    System.out.println(f1);
    if (f1.equals(f2)) {
      System.out.println("Las fechas son iguales");
    }

    var dias = Stream.of(f1, f2).map(Fecha::dia).toList();
    System.out.println(dias);

    var f3 = f1.withDia(f1.dia() + 1);
    System.out.println(f3);
  }
}
