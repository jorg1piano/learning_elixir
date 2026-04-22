defmodule TourTest do
  use ExUnit.Case
  doctest Tour

  test "greets the world" do
    assert Tour.hello() == :world
  end
end
