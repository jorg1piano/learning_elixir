defmodule IterationTest do
  use ExUnit.Case
  doctest Iteration

  test "sums the number" do
    assert Iteration.sum([1, 2, 3]) == 6
  end
end
