defmodule SupContadores do
  use Supervisor

  @impl true
  def init(_) do
    children = [
      {Contador, {:a, 5}},
      {Contador, {:b, 2}},
      {Contador, {:c, 3}}
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end
