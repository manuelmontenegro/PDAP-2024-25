# Funciones con documentación.

defmodule FuncionesSimples do

  @doc ~S"""
  Calcula el cuadrado del valor pasado como parámetro.

  ## Ejemplos

    iex> cuadrado(5)
    25
  """
  defp cuadrado(x) do
    x * x
  end

  @doc ~S"""
  ...
  """
  def suma_cuadrados(x, y) do
    cuadrado(x) + cuadrado(y)
  end
end
