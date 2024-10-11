defmodule ImplProtocolos do
  defmodule Persona do
    defstruct [:nombre, :edad]
  end

  defimpl String.Chars, for: Persona do
    def to_string(%Persona{} = p) do
      "#{p.nombre} (#{p.edad})"
    end
  end
  	
end
