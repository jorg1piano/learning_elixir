defmodule HelloWorldTest do
  use ExUnit.Case
  doctest HelloWorld

  test "hello/0 returns the :world atom" do
    assert HelloWorld.hello() == :world
  end

  describe "greet/1" do
    test "builds a greeting string" do
      assert HelloWorld.greet("Jorgen") == "Hello, Jorgen!"
    end

    test "works for any name" do
      assert HelloWorld.greet("Alice") == "Hello, Alice!"
      assert HelloWorld.greet("Bob") == "Hello, Bob!"
    end

    test "raises on non-string input" do
      assert_raise FunctionClauseError, fn ->
        HelloWorld.greet(123)
      end
    end
  end
end
