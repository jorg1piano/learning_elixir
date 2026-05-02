defmodule Todo.List do
  defstruct next_id: 1, entries: %{}

  def new(), do: %Todo.List{}

  def new(entries) do
    Enum.reduce(entries, fn item, todo_list -> add_entry(todo_list, item) end)
  end

  def add_entry(todo_list, entry) do
    entry_id = todo_list.next_id

    new_entries =
      Map.put(
        todo_list.entries,
        entry_id,
        Map.put(entry, :id, entry_id)
      )

    %Todo.List{
      entries: new_entries,
      next_id: todo_list.next_id + 1
    }
  end

  def entries(todo_list) do
    todo_list.entries
  end
end

defimpl Collectable, for: Todo.List do
  def into(original) do
    {original, &into_callback/2}
  end

  defp into_callback(todo_list, {:cont, entry}) do
    Todo.List.add_entry(todo_list, entry)
  end

  defp into_callback(todo_list, :done), do: todo_list
  defp into_callback(_todo_list, :halt), do: :ok
end
