#
# Demostración de por qué las excepciones perjudican la propiedad
# de transparencia referencial.
#

defmodule Excepciones do
  def g() do
    raise RuntimeError
  end

  def ejemplo() do
    x = g()
    try do
      x + 1
    rescue
      RuntimeError -> 0
    end
  end

  def ejemplo2() do
    try do
      g() + 1
    rescue
      RuntimeError -> 0
    end
  end

end