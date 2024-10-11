defmodule DefinicionProtocolos do
	defprotocol JSON do
    def to_json(elem)
  end

  defimpl JSON, for: Integer do
    def to_json(num), do: to_string(num)
  end	

  defimpl JSON, for: List do
    def to_json(xs) do
      "[" <>
        (Enum.map(xs, &JSON.to_json/1) |> Enum.join(", "))
        <> "]"
    end
  end 

  defmodule Punto do
    defstruct [:x, :y]
  end

  defimpl JSON, for: Punto do
    def to_json(p) do
      ~s({ "x" : #{JSON.to_json(p.x)}, "y" : #{JSON.to_json(p.y)} })
    end
  end 

end 