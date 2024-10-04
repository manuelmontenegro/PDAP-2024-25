#
# Implementación de un tipo unión mediante tuplas con etiquetas
#

defmodule Figuras do
  def area({:rectangulo, _, alto, ancho}), do: alto * ancho
  def area({:circulo, _, radio}), do: :math.pi() * radio * radio
  def area({:segmento, _, _}), do: 0
end