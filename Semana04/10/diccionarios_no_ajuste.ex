#
# Implementación de un tipo producto mediante diccionarios
# (sin utilizar ajuste de patrones en las funciones)
#

defmodule Fecha do
  def to_string(fecha) do
   "#{fecha.dia}/#{fecha.mes}/#{fecha.año}"
  end

  def primer_dia_mes?(fecha) do
    fecha.dia == 1
  end


  def siguiente_año(%{dia: 29, mes: 2} = fecha) do
    %{dia: 1, mes: 3, año: fecha.añño + 1}
  end
  def siguiente_año(fecha) do
    %{ fecha | año: fecha.año + 1 }
  end  
end