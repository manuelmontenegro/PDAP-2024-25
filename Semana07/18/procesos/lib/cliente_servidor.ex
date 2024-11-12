defmodule ClienteServidor do
  def calculadora() do
    receive do
      {pid, {:suma, x, y}} ->
        send(pid, {self(), x + y})
        calculadora()

      {pid, {:resta, x, y}} ->
        send(pid, {self(), x - y})
        calculadora()

      {_, :salir} ->
        :ok

      _ ->
        IO.puts("Mensaje desconocido")
        calculadora()
    end
  end

  def start() do
    spawn(ClienteServidor, :calculadora, [])
  end

  defp call(pid, msg) do
    send(pid, {self(), msg})

    receive do
      {^pid, result} -> result
    end
  end

  def suma(pid, x, y), do: call(pid, {:suma, x, y})
  def resta(pid, x, y), do: call(pid, {:resta, x, y})
end
