defmodule IsPositive do
  # Guards it's an extension of the basic pattern matching mechanism.
  def test(x) when is_number(x) and x < 0, do: :negative
  def test(x) when is_number(x) and x > 0, do: :postive
  def test(x) when x == 0, do: :zero
end
