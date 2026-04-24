defmodule Calculator do
  def add(a, b), do: a + b
  def add(a), do: add(a, 0)
end

defmodule CalculatorShorthand do
  # \\ generates a function with two arguments,
  # where the second argument has a default value of 0
  def add(a, b \\ 0), do: a + b
end
