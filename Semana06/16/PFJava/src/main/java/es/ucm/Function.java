/*
 * Interfaz para definir funciones de un parámetro.
 *
 * También está implementada en el paquete `java.util.function`
 */


package es.ucm;

public interface Function<T, S> {
    S apply(T x);
}