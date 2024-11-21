package es.ucm.unionSwitch;

public class SwitchTest {
  enum Mes { ENERO, FEBRERO, MARZO, ABRIL, MAYO, JUNIO, JULIO, AGOSTO, SEPTIEMBRE, OCTUBRE, NOVIEMBRE, DICIEMBRE };

  static int numDias(Mes m, int anyo) {
    return switch(m) {
      case Mes.FEBRERO -> {
        boolean esBisiesto = comprobarBisiesto(anyo);
        if (esBisiesto) {
          yield 29;
        } else {
          yield 28;
        }
      }
      case Mes.ABRIL, Mes.JUNIO, Mes.SEPTIEMBRE, Mes.NOVIEMBRE -> 30;
      default -> 31;
    };
  }

  private static boolean comprobarBisiesto(int anyo) {
    return true;
  }
}
