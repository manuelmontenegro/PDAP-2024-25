#
# Tipo option, y combinación mediante funciones de orden superior
#


defmodule TipoOption do
  def map_option({:ok, x}, f), do: {:ok, f.(x)}
  def map_option(:error, _), do: :error
  def map_option({:error, e}, _), do: {:error, e}

  def flat_map_option({:ok, x}, f), do: f.(x)
  def flat_map_option(:error, _), do: :error
  def flat_map_option({:error, e}, _), do: {:error, e}

  def flatten_option([]), do: {:ok, []}
  def flatten_option([{:ok, x} | xs]) do
    flatten_option(xs) |> map_option(&[x | &1])
  end
  def flatten_option([{:error, e} | _]), do: {:error, e}
  def flatten_option([:error | _]), do: :error


  def fetch(_, n) when n < 0, do: {:error, :negative_index}
  def fetch([], _), do: {:error, :out_of_bounds}
  def fetch([x | _], 0), do: {:ok, x}
  def fetch([_ | xs], n) do
    fetch(xs, n - 1)
  end


  def parse_list(str) do
    str 
    |> String.split() 
    |> Enum.map(fn str ->
      case Integer.parse(str) do
        {n, ""} -> {:ok, n}
        _ -> :error
      end
    end)
    |> flatten_option()
  end


  def read_number(filename, i) do
    File.read(filename)
      |> flat_map_option(&parse_list/1)
      |> flat_map_option(&(fetch(&1, i)))
  end


end