defmodule IOInspect do
  def example() do
    TodoListV3.new()
    |> TodoListV3.add_entry(%TodoItem{title: "New Item", date: ~D(2025-01-01)})
    # IO.inspect prints the structure and returns it, useful for debugging
    |> IO.inspect()
    |> TodoListV3.add_entry(%TodoItem{title: "Another item", date: ~D(2025-01-01)})
    |> IO.inspect()
  end
end
