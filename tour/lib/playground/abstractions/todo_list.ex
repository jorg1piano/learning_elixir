defmodule TodoList do
  def new(), do: %{}

  # Add a item on a date
  def add_entry(todo_list, date, item) do
    Map.update(
      todo_list,
      date,
      # The initial value
      [item],
      # if the key already exists(date) prepend the new item to the list holding the dates todo items
      fn items -> [item | items] end
    )
  end

  # Return the entries for the date
  def entries(todo_list, date) do
    Map.get(todo_list, date, [])
  end
end
