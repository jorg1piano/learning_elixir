defmodule InfiniteStreams do
  # In Dart terms, the underlying stream is like a sync* generator —
  # it produces values lazily on demand, never materializing the full
  # (infinite) sequence.
  def natural_numbers(count) do
    Enum.take(do_natural_numbers(), count)
  end

  # Stream.iterate builds a lazy, infinite stream by repeatedly applying
  # the function to the previous value, starting from 1.
  defp do_natural_numbers, do: Stream.iterate(1, &(&1 + 1))
end
