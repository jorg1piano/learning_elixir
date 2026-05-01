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
end
