defmodule IsPositive do
  # Guards it's an extension of the basic pattern matching mechanism.
  def test(x) when x < 0, do: :negative
  def test(x) when x == 0, do: :zero
  def test(x) when x > 0, do: :postive
end
