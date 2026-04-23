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
end
