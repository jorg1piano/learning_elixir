defmodule IsPositive do
  # Guards it's an extension of the basic pattern matching mechanism.
  def test(x) when x == 0, do: :zero
  def test(x) when is_number(x) and x < 0, do: :negative
  def test(x) when is_number(x) and x > 0, do: :postive
end

defmodule MultiClauseLambdas do
  def run do
    test_num = fn
      x when x == 0 -> :zero
      x when is_number(x) and x < 0 -> :negative
      x when is_number(x) and x > 0 -> :positive
    end

    IO.puts(test_num.(1))
    IO.puts(test_num.(-1))
    IO.puts(test_num.(0))
  end
end
