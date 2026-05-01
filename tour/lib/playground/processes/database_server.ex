# The message passing bits are completely abstracted away from the caller
#
# Here is an example proving that the server keeps running
# even after the first message is processed
# ```elixir
# iex(1)> server_pid = DatabaseServer.start()
# iex(2)> DatabaseServer.run_async(server_pid, "query 1")
# iex(3)> DatabaseServer.get_result()
# iex(4)> DatabaseServer.run_async(server_pid, "query 2")
# iex(5)> DatabaseServer.get_result()
# ```
#
# Create a pool, and pick a server at random, not very effective but proves the concept
# iex(1)> pool = Enum.map(1..100, fn _ -> DatabaseServer.start() end)
# iex(2)> Enum.each(
#           1..5,
#           fn query_def ->
#             server_pid = Enum.at(pool, :rand.uniform(100) - 1)
#             DatabaseServer.run_async(server_pid, query_def)
#           end
#         )
# iex(3)> Enum.map(1..5, fn _ -> DatabaseServer.get_result() end)
defmodule DatabaseServer do
  # "interface function" to start the server
  def start do
    spawn(&loop/0)
  end

  def run_async(server_pid, query_def) do
    send(server_pid, {:run_query, self(), query_def})
  end

  def get_result do
    receive do
      {:query_result, result} -> result
    after
      5000 -> {:error, :timeout}
    end
  end

  defp loop do
    receive do
      {:run_query, caller_pid, query_def} ->
        query_result = run_query(query_def)
        send(caller_pid, {:query_result, query_result})
    end

    # Constant stack space, tail call optimization will be applied
    # This is despites its looks, not cpu heavy
    loop()
  end

  defp run_query(query_def) do
    Process.sleep(2000)
    "#{query_def} result"
  end
end
