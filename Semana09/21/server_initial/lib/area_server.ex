defmodule AreaServer do
  def loop() do
    receive do
      {from, {:rectangle, width, height}} ->
        send(from, {self(), width * height})
        loop()
      {from, {:circle, radius}} ->
        send(from, {self(), :math.pi() * radius * radius})
        loop()
      {from, other} ->
        send(from, {self(), {:error, other}})
        loop()
    end
  end

  def start(), do: spawn_link(AreaServer, :loop, [])

  def area_rectangle(pid_server, width, height) do
    send(pid_server, {self(), {:rectangle, width, height}})
    receive do
      {^pid_server, response} -> response
    end
  end

  def area_circle(pid_server, radius) do
    send(pid_server, {self(), {:circle, radius}})
    receive do
      {^pid_server, response} -> response
    end
  end
end
