# Funciones recursivas sobre listas.

# El fichero `funciones_listas_ac.ex` contiene algunas variantes de las
# funciones mostradas aquí, pero con recursión de cola.


defmodule FuncionesListas do

  # La función `length` que definiremos a continuación ya está definida en el
  # módulo `Kernel` de la biblioteca estándar de Elixir. Este módulo se
  # importa automáticamente. Para evitar conflictos entre la función `length`
  # del módulo `Kernel` y la función `length` que definimos nosotros, la
  # siguiente línea indica que queremos importar las funciones del módulo
  # Kernel *excepto* la función `length`.

  import Kernel, except: [length: 1]

  # Calcula la longitud de una lista

  def length([]), do: 0
  def length([_ | xs]), do: 1 + length(xs)

  # Suma los elementos de una lista

  def sum([]), do: 0
  def sum([x | xs]), do: x + sum(xs)

  # Comprueba si un elemento pertenece a una lista

  def member?([], _), do: false
  def member?([x | _], x), do: true
  def member?([_ | ys], x), do: member?(ys, x)

  # Devuelve el último elemento de la lista

  def last([x]), do: x
  def last([_ | xs]), do: last(xs)

  # Concatena dos listas. Equivalente al operador `++` de Elixir.

  def append([], ys), do: ys
  def append([x | xs], ys) do
    [x | append(xs, ys)]
  end

  # Intercala los elementos de dos listas

  def interleave(xs, []), do: xs
  def interleave([], ys), do: ys
  def interleave([x | xs], [y | ys]) do
    [x, y | interleave(xs, ys)]
  end

  # Obtiene los `n` primeros elementos de una lista

  def take(_, 0), do: []
  def take([], _), do: []
  def take([x | xs], n) when n > 0 do
    [x | take(xs, n - 1)]
  end

  # A partir de dos listas, construye una lista de pares (esto es, tuplas de
  # dos elementos) emparejando los elementos que ocupan la misma posición.

  def zip([], _), do: []
  def zip(_, []), do: []
  def zip([x | xs], [y | ys]) do
    [{x, y} | zip(xs, ys)]
  end

  # Invierte el orden de los elementos de una lista.
  #
  # Ojo! Esta función tiene coste cuadrático con respecto a la longitud de la
  # lista. Es recomendable utilizar la versión lineal mostrada en el fichero
  # `funciones_listas_ac.ex`.

  def reverse([]), do: []
  def reverse([x | xs]) do
    reverse(xs) ++ [x]
  end


  # Elimina la primera aparición del segundo parámetro en la lista pasada como
  # primer parámetro.

  def delete([], _), do: []
  def delete([x | xs], x), do: xs
  def delete([x | xs], y) do
    [x | delete(xs, y)]
  end
end

