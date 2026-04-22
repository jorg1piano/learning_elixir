defmodule RawCounter do
  def start(initial_count), do: spawn(fn -> loop(initial_count) end)

  defp loop(count) do
    receive do
      {:inc, pid} ->
        new_count = count + 1
        send(pid, new_count)
        loop(new_count)

      {:get, pid} ->
        send(pid, count)
        loop(count)

      :stop ->
        :ok
    end
  end
end
