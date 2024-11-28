defmodule Exploder do
  def exploder() do
    IO.puts("Iniciando proceso exploder")
    exploder_loop()
  end

  defp exploder_loop() do
    IO.puts("Ejecutando exploder_loop")
    Process.sleep(1000)

    case :rand.uniform(5) do
      1 ->
        IO.puts("Finalizando exploder")
        exit(:explode)

      _ ->
        exploder_loop()
    end
  end
end
