# iex(1)> s1 = TodoServer.start()
# iex(2)> s2 = TodoServer.start()
# iex(3)> TodoServer.add_entry(s1, %{title: "apples"})
# iex(4)> TodoServer.add_entry(s2, %{title: "bananas"})
# iex(5)> TodoServer.entries(s1)
# iex(6)> TodoServer.entries(s2)
defmodule TodoServer do
  def start() do
    spawn(fn -> loop(TodoListFinal.new()) end)
  end

  def add_entry(server_pid, new_entry) do
    send(server_pid, {:add_entry, new_entry})
  end

  def entries(server_pid) do
    send(server_pid, {:entries, self()})

    receive do
      {:entries_reply, entries} -> entries
    after
      5000 -> {:error, :timeout}
    end
  end

  defp loop(todo_list) do
    new_todo_list =
      receive do
        {:add_entry, new_entry} ->
          TodoListFinal.add_entry(todo_list, new_entry)

        {:entries, pid} ->
          send(pid, {:entries_reply, TodoListFinal.entries(todo_list)})
          todo_list

        unknown ->
          IO.warn("Unknown message: #{inspect(unknown)}")
          todo_list
      end

    loop(new_todo_list)
  end
end
