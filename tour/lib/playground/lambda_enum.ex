defmodule LambdaEnum do
  def double(list) do
    Enum.map(
      list,
      # shorthand for:
      # fn x -> 2 * x end
      # & is the capture opeartor.
      # () groups the body
      # &1 is a placeholder for the first argument
      &(2 * &1)
    )
  end

  def even_numbers(list) do
    # Same as: Enum.filter(list, fn x -> rem(x, 2) == 1 end)
    Enum.filter(list, &(rem(&1, 2) == 0))
  end

  def odd_numbers(list) do
    Enum.filter(list, &(rem(&1, 2) == 1))
  end

  def sum(list) do
    # &+/2 captures the + function (arity 2) as an anonymous function value,
    # so it can be passed to Enum.reduce as the reducer.
    # Equivalent to: Enum.reduce(list, 0, fn a, b -> a + b end)
    # If I had my own add/2 function, the syntax would be: &add/2
    # In dart terms this is like a "tear-off" function
    Enum.reduce(list, 0, &+/2)
  end
end
