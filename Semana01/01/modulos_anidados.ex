# Módulos anidados

defmodule ModA do	
	defmodule ModB do
		def incr(x), do: x + 1
	end

	def sub(x, y), do: x - ModB.incr(y)
end


