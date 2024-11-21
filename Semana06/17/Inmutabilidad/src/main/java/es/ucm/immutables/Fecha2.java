package es.ucm.immutables;

import org.immutables.value.Value;

@Value.Immutable(builder = false,
                 copy = false)
public abstract class Fecha2 {
  @Value.Parameter public abstract int dia();
  @Value.Parameter public abstract int mes();
  @Value.Parameter public abstract int anyo();
}
