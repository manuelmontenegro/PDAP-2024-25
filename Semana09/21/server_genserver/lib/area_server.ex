defmodule AreaServer do
  use GenServer

  ########################################
  # Funciones callback de GenServer
  ########################################

  @impl true
  def init(_) do
    {:ok, []}
  end

  @impl true
  def handle_call({:rectangle, width, height}, _from, state) do
    {:reply, width * height, state}
  end

  def handle_call({:circle, radius}, _from, state) do
    {:reply, :math.pi() * radius * radius, state}
  end

  def handle_call(other, _from, state) do
    {:reply, {:error, other}, state}
  end

  @impl true
  def handle_info(msg, state) do
    IO.puts("Recibido mensaje: #{inspect(msg)}")
    {:noreply, state}
  end

  @impl true
  def terminate(_reason, _state) do
    IO.puts("Servidor finalizado")
  end

  ########################################
  # Funciones de interfaz
  ########################################

  def start(), do: GenServer.start(AreaServer, false)

  def area_rectangle(pid_server, width, height) do
    GenServer.call(pid_server, {:rectangle, width, height})
  end

  def area_circle(pid_server, radius) do
    GenServer.call(pid_server, {:circle, radius})
  end
end
