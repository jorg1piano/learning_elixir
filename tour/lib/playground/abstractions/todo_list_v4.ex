defmodule TodoListV4 do
  defstruct next_id: 1, entries: %{}

  def new(), do: %TodoListV4{}

  def add_entry(%TodoListV4{} = todo_list, entry) do
    entry = Map.put(entry, :id, todo_list.next_id)
    new_entries = Map.put(todo_list.entries, todo_list.next_id, entry)

    %TodoListV4{todo_list | entries: new_entries, next_id: todo_list.next_id + 1}
  end

  def entries(%TodoListV4{} = todo_list) do
    todo_list.entries
  end
end
