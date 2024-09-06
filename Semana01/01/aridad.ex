# Funciones con el mismo nombre y con distinta aridad

defmodule Aridad do
	# Máximo de dos parámetros
	def maximo(x, y) when x <= y, do: y
	def maximo(x, y), do: x

	# Máximo de tres parámetros
	def maximo(x, y, z), do: maximo(x, maximo(y, z))
end