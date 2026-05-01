defmodule TodoListV4Test do
  use ExUnit.Case
  doctest TodoListV4

  test "new creates a empty todo list" do
    assert TodoListV4.new().entries == %{}
  end

  test "adding a new item inserts the entry" do
    assert TodoListV4.new()
           |> TodoListV4.add_entry(%{title: "Item A"})
           |> TodoListV4.add_entry(%{title: "Item B"})
           |> TodoListV4.entries() == %{
             1 => %{id: 1, title: "Item A"},
             2 => %{id: 2, title: "Item B"}
           }
  end
end
