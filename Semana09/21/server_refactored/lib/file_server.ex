defmodule FileServer do
  def loop(state) do
    receive do
      {from, :call, request} ->
        case handle_call(request, from, state) do
          {:reply, response, new_state} ->
            send(from, {self(), response})
            loop(new_state)

          {:stop, response} ->
            send(from, {self(), response})
        end

      {_from, :cast, request} ->
        case handle_cast(request, state) do
          {:noreply, new_state} -> loop(new_state)
          :stop -> :ok
        end
    end
  end

  def handle_call(:list_dir, _from, dir) do
    {:reply, File.ls(dir), dir}
  end

  def handle_call({:get_file, file}, _from, dir) do
    path = Path.join(dir, file)
    {:reply, File.read(path), dir}
  end

  def handle_cast({:change_dir, new_dir}, _dir) do
    {:noreply, new_dir}
  end

  def start(dir) do
    spawn_link(FileServer, :loop, [dir])
  end

  def list_dir(pid_server) do
    call(pid_server, :list_dir)
  end

  def get_file(pid_server, file) do
    call(pid_server, {:get_file, file})
  end

  def change_dir(pid_server, new_dir) do
    cast(pid_server, {:change_dir, new_dir})
  end

  defp call(pid_server, request) do
    send(pid_server, {self(), :call, request})

    receive do
      {^pid_server, response} -> response
    end
  end

  defp cast(pid_server, request) do
    send(pid_server, {self(), :cast, request})
    :ok
  end
end
