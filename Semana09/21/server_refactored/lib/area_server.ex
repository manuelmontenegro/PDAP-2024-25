defmodule AreaServer do
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

  def handle_call({:rectangle, width, height}, _from, state) do
    {:reply, width * height, state}
  end

  def handle_call({:circle, radius}, _from, state) do
    {:reply, :math.pi() * radius * radius, state}
  end

  def handle_call(other, _from, state) do
    {:reply, {:error, other}, state}
  end

  def handle_cast(_, _), do: {:noreply, :ok}

  def start(), do: spawn_link(AreaServer, :loop, [:ok])

  def area_rectangle(pid_server, width, height) do
    call(pid_server, {:rectangle, width, height})
  end

  def area_circle(pid_server, radius) do
    call(pid_server, {:circle, radius})
  end

  defp call(pid_server, request) do
    send(pid_server, {self(), :call, request})

    receive do
      {^pid_server, response} -> response
    end
  end

  # defp cast(pid_server, request) do
  #   send(pid_server, {self(), :cast, request})
  #   :ok
  # end
end
