defmodule LambdaEnumTest do
  use ExUnit.Case
  doctest LambdaEnum

  test "doubles each number in the list" do
    assert LambdaEnum.double([1, 2, 3]) == [2, 4, 6]
  end

  test "even_numbers filters even numbers" do
    assert LambdaEnum.even_numbers([1, 2, 3, 4]) == [2, 4]
  end
end
