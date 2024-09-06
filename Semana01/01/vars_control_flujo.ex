# Uso de definiciones auxiliares y de estructuras de control de flujo
# (if, cond, guardas).

defmodule VarsControlFlujo do
  def suma_cuadrados(x, y) do
  	cuad_x = x * x
  	cuad_y = y * y
  	cuad_x + cuad_y
  end

  def signo(x) when x < 0 do
	  -1
	end

	def signo(x) when x == 0 do
	  0  
	end

	def signo(x) when x > 0 do
	  1
	end


	def signo_string(x) when x > 0, do: "Positivo"
	def signo_string(x) when x < 0, do: "Negativo"


	def abs(x) do
		y = if x >= 0 do
			x
		else
			-x
		end
		y
	end


	def signo2(x) do
		cond do
			x < 0  -> -1
			x == 0 -> 0
			x > 0  -> 1
		end		
	end
end