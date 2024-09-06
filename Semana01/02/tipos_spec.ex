# Especificaciones de tipos en Elixir

defmodule TiposSpec do
  @spec incr(integer) :: integer
  def incr(x) do
    x + 1
  end
end