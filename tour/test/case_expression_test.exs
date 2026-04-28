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
  end
end
