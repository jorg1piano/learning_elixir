defmodule TodoListFinal do
  defstruct next_id: 1, entries: %{}

  def new(), do: %TodoListFinal{}

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

    %TodoListFinal{
      entries: new_entries,
      next_id: todo_list.next_id + 1
    }
  end

  def entries(todo_list) do
    todo_list.entries
  end
end

defmodule TodoList.CsvImporter do
  def import(csv_file_path) do
    with {:ok, contents} <- File.read(csv_file_path),
         date_title_pairs <-
           Enum.map(String.split(contents, "\n"), fn item -> String.split(item, ",") end) do
      Enum.reduce(
        date_title_pairs,
        TodoListFinal.new(),
        fn [date, title], acc -> TodoListFinal.add_entry(acc, %{date: date, title: title}) end
      )
    end
  end

  def add_to_todo([date, title], todolist) do
    TodoListFinal.add_entry(todolist, %{
      date: date,
      title: title
    })
  end
end
