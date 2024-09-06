#!/usr/bin/env elixir

# Ejemplo de un script que funciona en Elixir.

# Puede ejecutarse directamente en GNU/Linux o Mac, activando el *flag
# ejecutable*, o ejecutarse con `elixir suma_cuadrados.exs`.

defmodule FuncionesSimples do  
  defp cuadrado(x) do
    x * x
  end

  def suma_cuadrados(x, y) do
    cuadrado(x) + cuadrado(y)
  end
end

IO.puts("El resultado es:")
IO.puts(FuncionesSimples.suma_cuadrados(3, 4))

