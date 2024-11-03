# Ejemplos de funciones que hacen uso de streams

defmodule Streams do
  require Integer

  # Funciones transformadoras o de filtro sencillas, pero que imprimen
  # un mensaje por pantalla cada vez que son invocadas, para ilustrar
  # el orden en el que son invocadas.

  def multiplica_por_tres(x) do
    IO.puts("Multiplicando #{x} por tres")
    x * 3
  end

  def es_par(x) do
    IO.puts("Comprobando si #{x} es par")
    Integer.is_even(x)
  end


  def incrementar(x) do
    IO.puts("Incrementando #{x}")
    x + 1
  end

  # Función que devuelve un stream con los números de la sucesión
  # de Fibonacci

  def fibonacci_stream() do
    Stream.iterate({0, 1}, fn {x, y} -> {y, x + y} end)
      |> Stream.map(&elem(&1, 0))
  end

  # Función que devuelve un stream con las potencias de 2 comprendidas
  # entre n y m

  def potencias(n, m) when n <= m do
    Stream.iterate(1, &(&1 * 2))
      |> Stream.drop_while(&(&1 < n))
      |> Stream.take_while(&(&1 <= m))
      |> Enum.into([])
  end


  # Función que devuelve el primer valor múltiplo de 10 que se encuentra en el
  # fichero cuyo nombre se ha pasado como parámetro.
  
  def primer_multiplo_de_diez(fichero) do
    File.stream!(fichero, :line)
      |> Stream.map(fn line ->
          line |> String.trim() |> String.to_integer()
        end)
      |> Enum.find(&(rem(&1, 10) == 0))
  end

end