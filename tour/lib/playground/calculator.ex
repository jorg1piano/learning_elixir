defmodule Calculator do
  def add(a, b), do: a + b
  def add(a), do: add(a, 0)
end

defmodule CalculatorShorthand do
  # \\ generates a function with two arguments,
  # where the second argument has a default value of 0
  def add(a, b \\ 0), do: a + b
end

defmodule Circle do
  # @pi is a module attribute, which is a constant that can be used in the module
  @pi 3.14159
  def area(radius), do: @pi * radius * radius
end
