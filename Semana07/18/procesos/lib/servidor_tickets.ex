defmodule ServidorTickets do
  require Logger

  def tickets_loop(siguiente_ticket, max_tickets)
      when siguiente_ticket > max_tickets do
    Logger.info("Servidor de tickets finaliza")
  end

  def tickets_loop(siguiente_ticket, max_tickets) do
    receive do
      {pid, :get_ticket} ->
        send(pid, {self(), {:ticket, siguiente_ticket}})
        tickets_loop(siguiente_ticket + 1, max_tickets)

      _ ->
        Logger.warning("Mensaje incorrecto")
        tickets_loop(siguiente_ticket, max_tickets)
    end
  end

  def start(num_tickets) do
    spawn(ServidorTickets, :tickets_loop, [1, num_tickets])
  end

  def get_ticket(pid), do: call(pid, :get_ticket)

  defp call(pid, msg) do
    send(pid, {self(), msg})

    receive do
      {^pid, result} -> result
    end
  end
end
