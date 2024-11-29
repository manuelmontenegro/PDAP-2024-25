defmodule Tasks do
  def parallel_map(enumerable, f) do
    enumerable
    |> Enum.map(&Task.async(fn -> f.(&1) end))
    |> Task.await_many(:infinity)
  end

  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n - 1) + fib(n - 2)
end
