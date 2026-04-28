defmodule CaseExpressionsTest do
  use ExUnit.Case
  doctest CaseExpressions

  describe "max_num" do
    test "returns a when a == b" do
      assert CaseExpressions.max_num(1, 1) == 1
    end

    test "returns b when a < b" do
      assert CaseExpressions.max_num(0, 4) == 4
    end

    test "returns a when a > b" do
      assert CaseExpressions.max_num(5, 3) == 5
    end
  end
end
