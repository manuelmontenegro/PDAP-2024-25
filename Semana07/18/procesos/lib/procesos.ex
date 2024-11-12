defmodule Procesos do
  def escribir_mensaje() do
    IO.puts("Hola, mundo!")
    Process.sleep(10000)
  end

  def ejecutar_proceso(i) do
    pid = :erlang.pid_to_list(self())
    IO.puts("Iniciando proceso #{i} con PID #{pid}")
    Process.sleep(:rand.uniform(10000))
    IO.puts("Finalizando proceso #{i}")
  end

  def espera_receive() do
    IO.puts("Esperando mensaje...")

    receive do
      :hola -> IO.puts("Mensaje recibido")
    end

    IO.puts("Finalizando proceso...")
  end

  def espera_dos_receives() do
    x =
      receive do
        0 -> :a
        1 -> :b
      end

    y =
      receive do
        2 -> :a
        3 -> :b
      end

    IO.puts("x = #{x}, y = #{y}")
  end

  def calculadora() do
    receive do
      {:suma, x, y} when x >= 0 ->
        IO.puts("#{x} + #{y} = #{x + y}")

      {:resta, x, y} ->
        IO.puts("#{x} - #{y} = #{x - y}")

      otro ->
        IO.puts("Mensaje desconocido")
        IO.inspect(otro)
    end
  end

  def calculadora_loop() do
    receive do
      {:suma, x, y} ->
        IO.puts("#{x} + #{y} = #{x + y}")
        calculadora_loop()

      {:resta, x, y} ->
        IO.puts("#{x} - #{y} = #{x - y}")
        calculadora_loop()

      :salir ->
        IO.puts("Adios")
    end
  end
end
