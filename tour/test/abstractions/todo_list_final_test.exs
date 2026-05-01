defmodule TodoListFinalTest do
  use ExUnit.Case
  doctest TodoListFinal

  test "new creates a empty todo list" do
    assert TodoListFinal.new().entries == %{}
  end

  test "adding a new item inserts the entry" do
    assert TodoListFinal.new()
           |> TodoListFinal.add_entry(%{title: "Item A"})
           |> TodoListFinal.add_entry(%{title: "Item B"})
           |> TodoListFinal.entries() == %{
             1 => %{id: 1, title: "Item A"},
             2 => %{id: 2, title: "Item B"}
           }
  end

  test "works as collectable" do
    entries = [
      %{date: ~D(2023-01-01), title: "Item A"},
      %{date: ~D(2023-01-01), title: "Item B"},
      %{date: ~D(2023-01-01), title: "Item C"}
    ]

    assert Enum.into(entries, TodoListFinal.new()).entries() == %{
             1 => %{id: 1, date: ~D(2023-01-01), title: "Item A"},
             2 => %{id: 2, date: ~D(2023-01-01), title: "Item B"},
             3 => %{id: 3, date: ~D(2023-01-01), title: "Item C"}
           }
  end
end
