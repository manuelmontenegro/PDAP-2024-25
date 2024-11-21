package es.ucm.immutables;

import org.immutables.value.Value;

@Value.Immutable
public abstract class Fecha {
  public abstract int dia();
  public abstract int mes();
  public abstract int anyo();
}
