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
end
