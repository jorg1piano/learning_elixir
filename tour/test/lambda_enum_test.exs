defmodule LambdaEnumTest do
  use ExUnit.Case
  doctest LambdaEnum

  test "doubles each number in the list" do
    assert LambdaEnum.double([1, 2, 3]) == [2, 4, 6]
  end
end
