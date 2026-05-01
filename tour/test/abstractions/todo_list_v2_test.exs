defmodule TodoListV2Test do
  use ExUnit.Case
  doctest TodoListV2

  test "returns the todos added to the list on a date" do
    assert TodoListV2.new()
           |> TodoListV2.add_entry(~D[2025-01-01], "Crossfit")
           |> TodoListV2.add_entry(~D[2025-01-01], "Legetime")
           |> TodoListV2.add_entry(~D[2025-01-02], "Styremøte")
           |> TodoListV2.entries(~D[2025-01-01]) == ["Legetime", "Crossfit"]
  end

  test "accessing a date without items returns an empty list" do
    assert TodoListV2.new()
           |> TodoListV2.entries(~D[2025-01-01]) == []
  end
end
