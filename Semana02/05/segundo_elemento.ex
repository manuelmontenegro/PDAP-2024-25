# Función que utiliza un `case` para obtener el segundo elemento de una
# lista.

defmodule SegundoElemento do
  def segundo_elemento(l) do
    case l do
      [_, y | _] -> y
      _ -> nil
    end
  end
end