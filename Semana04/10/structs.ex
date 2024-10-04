#
# Implementación de un tipo producto mediante structs
#

defmodule Fecha do

  defstruct [dia: 1, mes: 1, año: 2000]

  def to_string(%Fecha{} = f) do
   "#{f.dia}/#{f.mes}/#{f.año}"
  end

  def primer_dia_mes?(%Fecha{} = f) do
    f.dia == 1
  end

  def siguiente_año(%Fecha{dia: 29, mes: 2, año: a}) do
    %Fecha{dia: 1, mes: 3, año: a + 1}
  end
  def siguiente_año(%Fecha{año: a} = f) do
    %Fecha{ f | año: a + 1 }
  end  
end