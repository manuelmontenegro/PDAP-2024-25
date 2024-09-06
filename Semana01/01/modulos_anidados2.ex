# Igual que modulos_anidados.ex, pero ModB se declara fuera de la definición
# de ModA.

defmodule ModA do	
	def sub(x, y), do: x - y
end

defmodule ModA.ModB do
	def incr(x), do: x + 1
end




