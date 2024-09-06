# Uso de parámetros acumuladores

defmodule ParametrosAcumuladores do
  def factorial(n), do: factorial(n, 1)

  defp factorial(0, ac), do: ac
  defp factorial(n, ac) when n > 0 do
    factorial(n - 1, ac * n)
  end


  def duplicate(str, n), do: duplicate(str, n, "")

  defp duplicate(str, 0, ac), do: ac
  defp duplicate(str, n, ac) do
    duplicate(str, n - 1, ac <> str)
  end
end