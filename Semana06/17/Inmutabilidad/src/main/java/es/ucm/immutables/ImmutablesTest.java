package es.ucm.immutables;

public class ImmutablesTest {
  public static void main(String[] args) {
    Fecha f1 = ImmutableFecha.builder()
                .dia(10)
                .mes(3)
                .anyo(1983).build();

    Fecha f2  = ImmutableFecha.copyOf(f1).withAnyo(1984);


    System.out.println(f1);
    System.out.println(f2);


    Fecha2 f3 = ImmutableFecha2.of(15, 3, 1979);
  }
}
