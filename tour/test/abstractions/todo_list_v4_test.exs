defmodule TodoListV4Test do
  use ExUnit.Case
  doctest TodoListV4

  test "new creates a empty todo list" do
    assert TodoListV4.new().entries == %{}
  end
end
