defmodule MatchOperator do
  def run do
    # In Elixir, the left side is called a pattern and the right side is an expression.
    # A variable always matches the corresponding part of the right side, and in this case,
    # name and age get bound to the elements of the tuple.
    {name, age} = {"Bob", 25}

    IO.puts("Name: #{name}, Age: #{age}")
  end

  def run_with_mismatch do
    # If the pattern on the left does not match the structure of the right side, it will raise a MatchError.
    # {name, age} = "This does not match the pattern"
    # commented out so the project compiles without error
  end
end
