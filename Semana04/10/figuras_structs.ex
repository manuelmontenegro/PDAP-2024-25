#
# Implementación de un tipo unión mediante structs
#

defmodule Figuras do
  defmodule Rectangulo do
    defstruct [:centro, :alto, :ancho]
  end

  defmodule Circulo do
    defstruct [:centro, :radio]
  end

  defmodule Segmento do
    defstruct [:desde, :hasta]
  end

  def area(%Rectangulo{} = r), do: r.alto * r.ancho
  def area(%Circulo{} = c), do: :math.pi() * c.radio * c.radio
  def area(%Segmento{}), do: 0
end