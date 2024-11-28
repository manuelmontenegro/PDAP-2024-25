defmodule SupSencillo do
  def restarter(mod, fun, args) do
    Process.flag(:trap_exit, true)
    pid = spawn_link(mod, fun, args)

    receive do
      {:EXIT, ^pid, :normal} -> :ok
      {:EXIT, ^pid, :shutdown} -> :ok
      {:EXIT, ^pid, _} -> restarter(mod, fun, args)
    end
  end

  def start() do
    restarter(Exploder, :exploder, [])
  end
end
