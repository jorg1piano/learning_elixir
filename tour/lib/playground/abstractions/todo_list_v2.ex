defmodule TodoListV2 do
  def new(), do: MultiDict.new()

  def add_entry(todo_list, date, item) do
    MultiDict.add(todo_list, date, item)
  end

  def entries(todo_list, date) do
    MultiDict.get(todo_list, date)
  end
end

defmodule MultiDict do
  def new(), do: %{}

  def add(dict, key, value) do
    Map.update(dict, key, [value], &[value | &1])
  end

  def get(dict, key) do
    Map.get(dict, key, [])
  end
end
