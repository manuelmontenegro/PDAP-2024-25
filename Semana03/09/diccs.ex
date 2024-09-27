# Algunas funciones sobre diccionarios

defmodule Diccionarios do

  # Obtiene el valor asociado a una clave dentro del diccionario
  # Una función similar existe en el módulo `Map`: https://hexdocs.pm/elixir/Map.html#fetch/2
  
  def fetch(%{} = dicc, x) do
  	case dicc do
  		%{^x => v} -> {:ok, v}
  		_ -> :error
  	end
  end

  # Elimina de un diccionario aquellas claves que sean números pares
  # Se muestra a modo de ejemplo, pero también existe una función `filter` dentro del módulo `Map`
  # Más información: https://hexdocs.pm/elixir/Map.html#filter/2

  def eliminar_pares(dicc) do
  	dicc
  	|> Enum.filter(fn {k, _} -> rem(k, 2) == 1 end)
  	|> Enum.into(%{})
  end
end