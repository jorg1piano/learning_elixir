defmodule TodoListV3Test do
  use ExUnit.Case
  doctest TodoListV3

  test "returns the todos added to the list on a date" do
    assert TodoListV3.new()
           |> TodoListV3.add_entry(%TodoItem{title: "Crossfit", date: ~D[2025-01-01]})
           |> TodoListV3.add_entry(%TodoItem{title: "Legetime", date: ~D[2025-01-01]})
           |> TodoListV3.add_entry(%TodoItem{title: "Styremøte", date: ~D[2025-01-02]})
           |> TodoListV3.entries(~D[2025-01-01]) == [
             %TodoItem{title: "Legetime", date: ~D[2025-01-01]},
             %TodoItem{title: "Crossfit", date: ~D[2025-01-01]}
           ]
  end

  test "accessing a date without items returns an empty list" do
    assert TodoListV3.new()
           |> TodoListV3.entries(~D[2025-01-01]) == []
  end
end
