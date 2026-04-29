defmodule Iteration do
  def print_natural_nums(1), do: IO.puts(1)
  def print_natural_nums(num) when num < 0, do: {:error, "#{num} is not a natural number"}

  def print_natural_nums(n) do
    # Order matters: because the recursive call comes first, the prints happen
    # on the way *back up* the call stack — so numbers print in ascending order
    # (1 to n). Swapping the two lines would print n down to 1 instead, since
    # each call would print before recursing.
    # If we swapped the order we would print n to 1
    print_natural_nums(n - 1)
    IO.puts(n)
  end
end
