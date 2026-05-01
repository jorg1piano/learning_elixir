defmodule TodoItem do
  defstruct title: nil, date: nil
end

defmodule TodoListV3 do
  def new(), do: MultiDict.new()

  def add_entry(todo_list, item = %TodoItem{date: date}) do
    MultiDict.add(todo_list, date, item)
  end

  def entries(todo_list, date) do
    MultiDict.get(todo_list, date)
  end
end
