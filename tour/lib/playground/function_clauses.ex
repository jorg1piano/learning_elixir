# When there are multiple functions of the same arity,
# these are called function clauses.
# Here we pass pattern match on a tuple passed in the area function.
#
# From the caller's perspective, this is a single function (area/1)
# There is no way to target a specific version of this other than passing
# the correct argument, which is pattern matched at runtime.
#
# Invoked like `Geometry.area(%Geometry.Rectangle{a: 3, b: 4})`
defmodule Geometry do
  defmodule Rectangle do
    defstruct [:a, :b]
  end

  defmodule Circle do
    defstruct [:r]
  end

  defmodule Square do
    defstruct [:a]
  end

  # area/1
  # Matches when we have 3-tuple and first argument is a rectangle
  def area(%Rectangle{a: a, b: b}), do: a * b

  # Matches when we have 2-tuple and first argument is a circle
  def area(%Circle{r: r}), do: r * r * 3.14

  # Matches when we have 2-tuple and first argument is a square
  def area(%Square{a: a}), do: a * a
end
