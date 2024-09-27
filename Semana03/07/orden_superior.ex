defmodule OrdenSuperior do

  # Función que, dada una lista de funciones [f1, f2, ..., fn]
  # devuelve los resultados de aplicar las funciones al argumento
  # pasado como segundo parámetro.

  def apply_all([], _), do: []
  def apply_all([f | fs], x) do
    [f.(x) | apply_all(fs, x)]
  end
  
  # Función que calcula el máximo de una lista de elementos
  # La función es paramétrica con respecto a la operación utilizada
  # para comparar los elementos

  def max(xs, mayor_que \\ &>=/2)

  def max([x], _), do: x
  def max([x | xs], mayor_que) do
    max_tail = max(xs)
    if mayor_que.(x, max_tail), do: x, else: max_tail
  end

  # Posibles comparadores:

  # 1. Compara utilizando la segunda componente
  def comp_segunda_componente({_, x}, {_, y}), do: x >= y

  # 2. Compara utilizando la suma de las componentes
  def comp_suma({x1, y1}, {x2, y2}), do: x1 + y1 >= x2 + y2


  # Aplicación del operador pipe (|>) para transformar
  # una cadena de texto.

  def magnificar(str) do
    str
    |> String.trim()
    |> String.downcase()
    |> String.replace(~r{buen(o)?}, "maravilloso")
    |> String.upcase()
    |> (fn str -> "¡¡#{str}!!" end).()
  end
end