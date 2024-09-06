# Funciones que admiten parámetros por defecto

# Versión que define dos veces la misma función: una con un parámetro y otra
# con dos parámetros.

defmodule ParametrosDefecto1 do
	def precio_final(precio, descuento) do
	  precio - (precio * descuento / 100)
	end

	def precio_final(precio) do
	  precio_final(precio, 10)
	end
end

# Versión que utiliza los parámetros por defecto de Elixir.

defmodule ParametrosDefecto2 do
	def precio_final(precio, descuento \\ 10) do
	  precio - (precio * descuento / 100)
	end
end


# Versión que utiliza parámetros por defecto, pero en este caso la función
# `precio_final` tiene varias cláusulas.

defmodule ParametrosDefecto3 do
	def precio_final(precio, descuento \\ 10)

	def precio_final(precio, descuento) when descuento >= 0 do
	  precio - (precio * descuento / 100)
	end
	def precio_final(precio, descuento) when descuento < 0 do
	  precio
	end
end