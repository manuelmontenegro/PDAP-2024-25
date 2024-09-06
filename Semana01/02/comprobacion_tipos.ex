# Funciones de comprobación de tipos (`is_XXXXX`)

defmodule ComprobacionTipos do
  def incr(x) when is_number(x) do
  	x + 1
  end
  def incr(str) when is_binary(str) do
  	String.to_integer(str) + 1
  end
end