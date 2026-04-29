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

  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def sum_with_tail_call(current_sum, []), do: current_sum

  def sum_with_tail_call(current_sum, [head | tail]) do
    new_sum = head + current_sum
    # Tail-recursive: the recursive call is the last thing this function does,
    # with no work happening after it returns. The BEAM applies tail call
    # optimization (TCO) here, reusing the current stack frame instead of
    # pushing a new one. This means the function uses constant stack space
    # regardless of list length, so it can handle arbitrarily large lists
    # without a stack overflow.
    #
    # Our function above sum\1 would not have the same optimilization available
    sum_with_tail_call(new_sum, tail)
  end
end
