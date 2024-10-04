#
# Implementación de un tipo producto mediante tuplas
#

defmodule Fecha do
  def to_string({dia, mes, año}) do
   "#{dia}/#{mes}/#{año}"
  end

  def primer_dia_mes?({dia, _, _}) do
    dia == 1
  end


  def siguiente_año({29, 2, año}) do
    {1, 3, año + 1}
  end
  def siguiente_año({dia, mes, año}) do
    {dia, mes, año + 1}
  end
end