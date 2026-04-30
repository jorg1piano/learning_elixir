defmodule LambdaEnumTest do
  use ExUnit.Case
  doctest LambdaEnum

  test "doubles each number in the list" do
    assert LambdaEnum.double([1, 2, 3]) == [2, 4, 6]
  end

  test "even_numbers returns even numbers" do
    assert LambdaEnum.even_numbers([1, 2, 3, 4]) == [2, 4]
  end

  test "odd_numbers returns odd numbers" do
    assert LambdaEnum.odd_numbers([1, 2, 3, 4]) == [1, 3]
  end

  test "sum sums the list" do
    assert LambdaEnum.sum([2, 2, 4]) == 8
  end
end
