# Ejemplos de funciones que hacen uso de evaluación impaciente

defmodule EvaluacionImpaciente do

  # Condicional: dada una condición `b`, si la condición es cierta devuelve el
  # primer parámetro; si es falsa, devuelve el segundo parámetro.

  # Ambos parámetros se evalúan de manera estricta, de modo que cond(true, 1,
  # 1/0) devuelve error

  def cond(b, x, y) do
    if b, do: x, else: y
  end

  # Función de búsqueda en una keyword list. Si la clave a buscar no se
  # encuentra, se devuelve el valor default pasado como tercer parámetro.
  
  def get([], _, default), do: default
  def get([{k, v} | _], k, _), do: v
  def get([{_, _} | ks], k, default) do
    get(ks, k, default)
  end
end