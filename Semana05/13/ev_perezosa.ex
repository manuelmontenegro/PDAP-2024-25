# Ejemplos de funciones que hacen uso de evaluación perezosa

defmodule EvaluacionPerezosa do
  
  # Condicional: dada una condición `b`, si la condición es cierta devuelve el
  # primer parámetro; si es falsa, devuelve el segundo parámetro.

  # Ambos parámetros se evalúan de manera perezosa, de modo que en la expresión
  #
  # cond(true, fn -> 1 end, fn -> 1/0 end)
  #
  # la divisón 1/0 nunca llega a evaluarse

  def cond(b, x, y) do
    if b, do: x.(), else: y.()
  end

  # Función de búsqueda en una keyword list. Si la clave a buscar no se
  # encuentra, se devuelve el valor default pasado como tercer parámetro,
  # pero este valor solo se evalúa si la clave no se encuentra.

  def get_lazy([], _, default), do: default.()
  def get_lazy([{k, v} | _], k, _), do: v
  def get_lazy([{_, _} | ks], k, default) do
    get_lazy(ks, k, default)
  end
end