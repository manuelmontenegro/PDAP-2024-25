defmodule TicketServer do
  def loop(tickets) do
    receive do
      {from, :get_ticket} ->
        case tickets do
          [] ->
            send(from, {self(), :error})
          [t] ->
            send(from, {self(), t})
          [t|ts] ->
            send(from, {self(), t})
            loop(ts)
        end
    end
  end

  def start(num_tickets) do
    spawn_link(TicketServer, :loop, [Enum.into(1..num_tickets, [])])
  end

  def get_ticket(pid_server) do
    send(pid_server, {self(), :get_ticket})
    receive do
      {^pid_server, response} -> response
    end
  end
end
