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

  describe "traffic_light" do
    test "when light is green :go is returned" do
      assert CaseExpressions.trafic_light("green") == :go
    end

    test "when light is red :stop is returned" do
      assert CaseExpressions.trafic_light("red") == :stop
    end

    test "when light is yellow :slow_down is returned" do
      assert CaseExpressions.trafic_light("yellow") == :slow_down
    end

    test "it not green, red or yellow we get :unknown_signal" do
      assert CaseExpressions.trafic_light("unknown_signal") == :unknown_signal
    end
  end

  describe "command_parser" do
    test "add returns {:add, a, b}" do
      assert CaseExpressions.command_parser("add 1 2") == {:ok, :add, 1, 2}
    end

    test "subtract returns {:subtract, a, b}" do
      assert CaseExpressions.command_parser("subtract 1 2") == {:ok, :subtract, 1, 2}
    end

    test "multiply returns {:multiply, a, b}" do
      assert CaseExpressions.command_parser("multiply 1 2") == {:ok, :multiply, 1, 2}
    end

    test "divide returns {:divide, a, b}" do
      assert CaseExpressions.command_parser("divide 1 2") == {:ok, :divide, 1, 2}
    end

    test "divide on zero returns {:error, reason}" do
      assert CaseExpressions.command_parser("divide 10 0") == {:error, "cannot divide by zero"}
    end
  end

  describe "positive" do
    test "returns a new list with positive numbers" do
      assert Iteration.positive([-2, 1, 2, 3, -5]) == [1, 2, 3]
    end
  end
end
