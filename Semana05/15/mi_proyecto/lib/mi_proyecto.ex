defmodule MiProyecto do
  @moduledoc """
    Funciones básicas a incorporar en mi proyecto.

    La documentación puede ser escrita en formato *Markdown*
  """


  @doc """
    Devuelve el resultado de incrementar el valor `x` pasado como parámetro

      iex> incrementar(3)
      4
      iex> incrementar(4)
      5
  """
  def incrementar(x) do
    x + 1
  end

  # def leer_csv() do
  #   File.stream!("mi_fichero.csv")
  #   |> CSV.decode!(headers: true)
  # end
end
