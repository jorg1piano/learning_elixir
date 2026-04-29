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

  # In a real app this would probably be called defp do_sum and be called from
  # sum. This will give us a nice interface and also the tail call optimization.
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

  def range(from, to), do: do_range([], from, to + 1)

  defp do_range(current, from, to) when from == to, do: current

  defp do_range(current, from, to) do
    next = to - 1
    # Counting down and prepending each value gives us an ascending list
    # without needing to reverse at the end. Prepending is O(1), while
    # appending with ++ would be O(n) per step (turning the whole function
    # into O(n²)).
    current = [next | current]
    do_range(current, from, next)
  end
end
