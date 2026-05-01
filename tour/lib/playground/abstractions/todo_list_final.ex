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
  @moduledoc """
  Imports a TodoList from a CSV file with `date,title` rows.
  """

  def from_file(csv_file_path) do
    csv_file_path
    # Read line by line (lazy)
    |> File.stream!()
    # Strip the trailing newline from each line
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    # Skip empty lines (e.g. a trailing newline at the end of the file)
    |> Stream.reject(&(&1 == ""))
    # Split each line into [date, title]
    |> Stream.map(&String.split(&1, ","))
    # Naive validation, reject if pattern does not match
    |> Stream.filter(&match?([_date, _title], &1))
    # Convert date string to DateTime
    |> Stream.map(fn [date, title] -> [Date.from_iso8601(date), title] end)
    # Build up the todo list by inserting each entry
    |> Enum.reduce(TodoListFinal.new(), fn [date, title], list ->
      TodoListFinal.add_entry(list, %{date: date, title: title})
    end)
  end
end
