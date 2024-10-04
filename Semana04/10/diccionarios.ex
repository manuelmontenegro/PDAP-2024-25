#
# Implementación de un tipo producto mediante diccionarios
# (utilizando ajuste de patrones en las funciones)
#

defmodule Fecha do
  def to_string(%{dia: d, mes: m, año: a}) do
   "#{d}/#{m}/#{a}"
  end

  def primer_dia_mes?(%{dia: d}) do
    d == 1
  end


  def siguiente_año(%{dia: 29, mes: 2, año: a}) do
    %{dia: 1, mes: 3, año: a + 1}
  end
  def siguiente_año(%{año: a} = fecha) do
    %{ fecha | año: a + 1 }
  end  
end