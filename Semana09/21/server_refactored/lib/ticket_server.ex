defmodule TicketServer do
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

  def handle_call(:get_ticket, _from, []) do
    {:stop, :error}
  end

  def handle_call(:get_ticket, _from, [t]) do
    {:stop, t}
  end

  def handle_call(:get_ticket, _from, [t | ts]) do
    {:reply, t, ts}
  end

  def handle_cast(_, _), do: {:noreply, :ok}

  def start(num_tickets) do
    spawn_link(TicketServer, :loop, [Enum.into(1..num_tickets, [])])
  end

  def get_ticket(pid_server) do
    call(pid_server, :get_ticket)
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
