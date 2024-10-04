#
# Tipo option, y combinación mediante with
#

defmodule TipoOption do
  def fetch(_, n) when n < 0, do: {:error, :negative_index}
  def fetch([], _), do: {:error, :out_of_bounds}
  def fetch([x | _], 0), do: {:ok, x}
  def fetch([_ | xs], n) do
    fetch(xs, n - 1)
  end

  def flatten_option([]), do: {:ok, []}
  def flatten_option([x | xs]) do
    with {:ok, v} <- x,
         {:ok, vs} <- flatten_option(xs) do
      {:ok, [v | vs]}       
    end
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
    with {:ok, contents} <- File.read(filename),
         {:ok, list} <- parse_list(contents),
         {:ok, n} <- fetch(list, i) do
      {:ok, n}
    else
      {:error, :enoent} -> {:error, :file_not_found}
      {:error, :negative_index} -> {:error, :bad_index}
      {:error, :out_of_bounds} -> {:error, :bad_index}
      :error -> {:error, :bad_format}
    end
  end


end