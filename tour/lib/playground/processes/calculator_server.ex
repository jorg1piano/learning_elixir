# Start server, add 3, remove 2, in the end we have value = 1
# iex(1)> server_pid = CalculatorServer.start()
# iex(2)> CalculatorServer.value(server_pid)
# iex(3)> CalculatorServer.add(server_pid, 3)
# iex(4)> CalculatorServer.value(server_pid)
# iex(5)> CalculatorServer.sub(server_pid, 2)
# iex(4)> CalculatorServer.value(server_pid)

defmodule CalculatorServer do
  def start() do
    spawn(fn -> loop(0) end)
  end

  def value(server_pid) do
    send(server_pid, {:value, self()})

    receive do
      {:response, value} -> value
    end
  end

  def add(pid, num), do: send(pid, {:add, num})
  def sub(pid, num), do: send(pid, {:sub, num})
  def mul(pid, num), do: send(pid, {:mul, num})
  def div(pid, num), do: send(pid, {:div, num})

  defp loop(current_value) do
    new_value =
      receive do
        {:value, caller_pid} ->
          send(caller_pid, {:response, current_value})
          current_value

        {:add, value} ->
          current_value + value

        {:sub, value} ->
          current_value - value

        {:mul, value} ->
          current_value * value

        {:div, value} ->
          current_value / value

        invalid_request ->
          IO.puts("invalid request #{inspect(invalid_request)}")
          current_value
      end

    loop(new_value)
  end
end
