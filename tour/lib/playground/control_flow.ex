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

  def match_returns do
    # The match operator returns the value on the right side if the match is successful.
    result = {name, age} = {"Alice", 30}
    IO.puts("Result of match: #{inspect(result)}")
    IO.puts("Name: #{name}, Age: #{age}")
  end
end

defmodule NestedMatching do
  def simple do
    {_, time} = :calendar.local_time()
    {hour, minute, second} = time
    IO.puts("Current time: #{time}")
    IO.puts("Hour: #{hour}, Minute: #{minute}, Second: #{second}")
  end

  def nested do
    {_, {hour, minute, _}} = :calendar.local_time()
    IO.puts("Current time: #{hour}:#{minute}")
  end
end

# The pin operator (^) is used to match against the value of an already bound variable.
# In simple speak, you could for example match the contents of a string.
defmodule PinOperator do
  def run_without_pin do
    name = "Jorgen"
    IO.puts("Name: #{name}")
    # This will rebind the variable name to "Peter" instead of matching against "Jorgen".
    {name} = {"Peter"}
    IO.puts("Name: #{name}")
  end

  def run_with_pin do
    name = "Jorgen"
    IO.puts("Name: #{name}")

    # This will match against the value of name, which is "Jorgen", and raise a MatchError because it does not match "Peter".
    # commented out so it compiles without error
    # {^name} = {"Peter"}
  end
end
