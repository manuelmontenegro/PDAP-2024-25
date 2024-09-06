# Funciones simples

defmodule FuncionesSimples do  
  defp cuadrado(x) do
    x * x
  end

  def suma_cuadrados(x, y) do
    cuadrado(x) + cuadrado(y)
  end
end
