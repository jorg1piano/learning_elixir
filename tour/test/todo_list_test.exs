defmodule TodoListTest do
  use ExUnit.Case
  doctest TodoList

  test "returns the todos added to the list on a date" do
    assert TodoList.new()
           |> TodoList.add_entry(~D[2025-01-01], "Crossfit")
           |> TodoList.add_entry(~D[2025-01-01], "Legetime")
           |> TodoList.add_entry(~D[2025-01-02], "Styremøte")
           |> TodoList.entries(~D[2025-01-01]) == ["Legetime", "Crossfit"]
  end
end
