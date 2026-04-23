defmodule SecretPasswordTest do
  use ExUnit.Case
  doctest SecretPassword

  test "given a left turn at 0 we get 99" do
    assert SecretPassword.step({:left, 1}, 0) == 99
  end

  test "given a right turn at 0 we get 1" do
    assert SecretPassword.step({:right, 1}, 0) == 1
  end

  test "given a right turn at 99 we get 0" do
    assert SecretPassword.step({:right, 1}, 0) == 1
  end

  test "given 100 right turn at 99 we get 0" do
    assert SecretPassword.step({:right, 100}, 0) == 0
  end

  test "given 68 left turn at 50 we get 82" do
    assert SecretPassword.step({:left, 68}, 50) == 82
  end

  test "given 55 left turn at 55 we get 0" do
    assert SecretPassword.step({:left, 55}, 55) == 0
  end

  test "given 4 left turn at 0 we get 96" do
    assert SecretPassword.step({:left, 4}, 0) == 96
  end
end
