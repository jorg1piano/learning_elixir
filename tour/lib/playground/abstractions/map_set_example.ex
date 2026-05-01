defmodule MapSetExample do
  def produce_week() do
    # The pipe operator (|>) passes its left side as the first argument to
    # the function on the right. So `MapSet.new() |> MapSet.put(:monday)`
    # is equivalent to `MapSet.put(MapSet.new(), :monday)`.
    # This is why "data first" is a common convention in Elixir APIs,
    # it makes functions pipe-friendly.
    MapSet.new()
    |> MapSet.put(:monday)
    |> MapSet.put(:tuesday)
    |> MapSet.put(:wednesday)
    |> MapSet.put(:thursday)
    |> MapSet.put(:friday)
    |> MapSet.put(:saturday)
    |> MapSet.put(:sunday)
  end
end
