defmodule FileServer do
  use GenServer

  @impl true
  def init(dir) do
    {:ok, dir}
  end

  @impl true
  def handle_call(:list_dir, _from, dir) do
    {:reply, File.ls(dir), dir}
  end

  def handle_call({:get_file, file}, _from, dir) do
    path = Path.join(dir, file)
    {:reply, File.read(path), dir}
  end

  @impl true
  def handle_cast({:change_dir, new_dir}, _dir) do
    {:noreply, new_dir}
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

  def start(dir) do
    GenServer.start_link(FileServer, dir)
  end

  def list_dir(pid_server) do
    GenServer.call(pid_server, :list_dir)
  end

  def get_file(pid_server, file) do
    GenServer.call(pid_server, {:get_file, file})
  end

  def change_dir(pid_server, new_dir) do
    GenServer.cast(pid_server, {:change_dir, new_dir})
  end
end
