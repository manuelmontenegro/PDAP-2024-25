defmodule FileServer do
  def loop(dir) do
    receive do
      {from, :list_dir} ->
        send(from, {self(), File.ls(dir)})
        loop(dir)
      {from, {:get_file, file}} ->
        path = Path.join(dir, file)
        send(from, {self(), File.read(path)})
        loop(dir)
      {_from, {:change_dir, new_dir}} ->
        loop(new_dir)
    end
  end

  def start(dir) do
    spawn_link(FileServer, :loop, [dir])
  end

  def list_dir(pid_server) do
    send(pid_server, {self(), :list_dir})
    receive do
      {^pid_server, response} -> response
    end
  end

  def get_file(pid_server, file) do
    send(pid_server, {self(), {:get_file, file}})
    receive do
      {^pid_server, response} -> response
    end
  end

  def change_dir(pid_server, new_dir) do
    send(pid_server, {self(), {:change_dir, new_dir}})
  end
end
