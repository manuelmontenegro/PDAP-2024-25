defmodule TicketServer do
  use GenServer

  @impl true
  def init(num_tickets) do
    {:ok, Enum.into(1..num_tickets, [])}
  end

  @impl true
  def handle_call(:get_ticket, _from, []) do
    {:stop, :normal, :error, []}
  end

  def handle_call(:get_ticket, _from, [t]) do
    {:stop, :normal, t, []}
  end

  def handle_call(:get_ticket, _from, [t | ts]) do
    {:reply, t, ts}
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

  def start(num_tickets) do
    GenServer.start_link(TicketServer, num_tickets)
  end

  def get_ticket(pid_server) do
    GenServer.call(pid_server, :get_ticket)
  end
end
