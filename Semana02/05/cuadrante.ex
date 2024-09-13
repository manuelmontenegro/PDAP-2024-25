# Función que utiliza ajuste de patrones en una función de varias cláusulas.

defmodule Cuadrante do
  def cuadrante({x, y}) when x > 0 and y > 0, do: :primero
  def cuadrante({x, y}) when x < 0 and y > 0, do: :segundo
  def cuadrante({x, y}) when x < 0 and y < 0, do: :tercero
  def cuadrante({x, y}) when x > 0 and y < 0, do: :cuarto
  def cuadrante({0, 0}), do: :origen
  def cuadrante({_, _}), do: :frontera
  # def cuadrante(_), do: {:error, :invalid_argument}
end