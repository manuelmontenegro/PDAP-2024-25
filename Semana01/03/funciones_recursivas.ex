# Funciones recursivas básicas

defmodule Recursivas do
  def factorial(0), do: 1
  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

  def pow(_, 0), do: 1
  def pow(x, n) when n > 0 do
    x * pow(x, n - 1)
  end

  def contar(ini, fin) when ini > fin, do: :ok
  def contar(ini, fin) when ini <= fin do
    IO.puts("Número #{ini}")
    contar(ini + 1, fin)
  end

  def contar_no_rec_cola(ini, fin) when ini > fin, do: :ok
  def contar_no_rec_cola(ini, fin) when ini <= fin do
    contar_no_rec_cola(ini, fin - 1)
    IO.puts("Número #{fin}")
  end

end