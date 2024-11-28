defmodule Contador do
  use GenServer

  @impl true
  def init({id, max}) when max >= 0 do
    Process.flag(:trap_exit, true)
    IO.puts("Iniciando contador '#{id}'")
    {:ok, {id, max, 0}}
  end

  def init({_, _}), do: {:stop, :max_negative}

  @impl true
  def handle_cast(:incrementar, {id, max, n}) when n < max do
    IO.puts("Incrementando el contador '#{id}': #{n} => #{n + 1}")
    {:noreply, {id, max, n + 1}}
  end

  def handle_cast(:incrementar, {id, max, n}) when n == max do
    IO.puts("El contador '#{id}' rebasa el máximo.")
    {:stop, :normal, {id, max, n}}
  end

  def handle_cast(:decrementar, {id, max, n}) when n > 0 do
    IO.puts("Decrementando el contador '#{id}': #{n} => #{n - 1}")
    {:noreply, {id, max, n - 1}}
  end

  def handle_cast(:decrementar, {id, max, n}) when n == 0 do
    IO.puts("El contador '#{id}' se hace negativo.")
    {:stop, :valor_negativo, {id, max, n}}
  end

  @impl true
  def handle_call(:leer, _, {_, _, n} = st) do
    {:reply, n, st}
  end

  @impl true
  def terminate(reason, {id, _, _}) do
    IO.puts("El contador '#{id}' termina con el motivo '#{reason}'")
  end

  def iniciar(id, max) do
    GenServer.start_link(Contador, {id, max}, name: id)
  end

  def incrementar(id), do: GenServer.cast(id, :incrementar)
  def decrementar(id), do: GenServer.cast(id, :decrementar)

  def leer(id), do: GenServer.call(id, :leer)

  def child_spec({id, max}) do
    %{
      id: id,
      start: {Contador, :iniciar, [id, max]},
      restart: :transient
    }
  end
end
