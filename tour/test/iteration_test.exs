defmodule IterationTest do
  use ExUnit.Case
  doctest Iteration

  test "sums the number" do
    assert Iteration.sum([1, 2, 3]) == 6
  end

  test "sums the number (with tail call)" do
    assert Iteration.sum_with_tail_call(0, [1, 2, 3]) == 6
  end

  test "returns positive range of numbers" do
    assert Iteration.range(0, 4) == [0, 1, 2, 3, 4]
  end
end
