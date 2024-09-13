defmodule FuncionesListasAc do
  import Kernel, except: [length: 1]


  def length(xs), do: length(xs, 0)

  defp length([], ac), do: ac
  defp length([_|xs], ac), do: length(xs, 1 + ac)
  
  def sum(xs), do: sum(xs, 0)

  defp sum([], ac), do: ac
  defp sum([x | xs], ac), do: sum(xs, ac + x)


  def member?([], _), do: false
  def member?([x | _], x), do: true
  def member?([_ | ys], x), do: member?(ys, x)


  def reverse(xs), do: reverse(xs, [])

  defp reverse([], ac), do: ac
  defp reverse([x | xs], ac) do
    reverse(xs, [x | ac])
  end

end