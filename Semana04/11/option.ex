#
# Tipo option, y combinación mediante anidamento de `case`
#

defmodule TipoOption do
  def fetch(_, n) when n < 0, do: {:error, :negative_index}
  def fetch([], _), do: {:error, :out_of_bounds}
  def fetch([x | _], 0), do: {:ok, x}
  def fetch([_ | xs], n) do
    fetch(xs, n - 1)
  end

  def parse_list(str) do
    str |> String.split() |> parse_numbers()
  end

  defp parse_numbers([]), do: {:ok, []}
  defp parse_numbers([str | strs]) do
    case Integer.parse(str) do
      {n, ""} -> 
        case parse_numbers(strs) do
          {:ok, ns} -> {:ok, [n | ns]}
          :error -> :error
        end
      _ -> :error
    end
  end


  def read_number(filename, i) do
    case File.read(filename) do
      {:error, e} -> {:error, e}
      {:ok, contents} ->
        case parse_list(contents) do
          :error -> {:error, :bad_format}
          {:ok, list} ->
            case fetch(list, i) do
              {:error, _} -> {:error, :bad_index}
              {:ok, n} -> {:ok, n}
            end
        end
    end
  end


end