# Funciones de orden superior sobre listas
# Todas se encuentran definidas en el módulo Enum

defmodule OrdenSuperiorListas do

	def map([], _), do: []
  def map([x | xs], f) do
    [f.(x) | map(xs, f)]
  end

  def filter([], _), do: []
  def filter([x | xs], f) do
    if f.(x) do
      [x | filter(xs, f)]
    else
      filter(xs, f)
    end
  end

  def reduce([], ac, _), do: ac
  def reduce([x | xs], ac, f) do
    reduce(xs, f.(x, ac), f)
  end

  def reduce([x | xs], f) do
    reduce(xs, x, f)
  end

  def flat_map([], _), do: []
  def flat_map([x | xs], f) do
    f.(x) ++ flat_map(xs, f)
  end

  def zip_with([], _, _), do: []
  def zip_with(_, [], _), do: []
  def zip_with([x | xs], [y | ys], f) do
    [f.(x, y) | zip_with(xs, ys, f)]    
  end
end
