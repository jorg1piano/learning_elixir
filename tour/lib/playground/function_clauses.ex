# When there are multiple functions of the same arity,
# these are called function clauses.
# Here we pass pattern match on a tuple passed in the area function.
#
# From the caller's perspective, this is a single function (area/1)
# There is no way to target a specific version of this other than passing
# the correct argument, which is pattern matched at runtime.
defmodule Geometry do
  # area/1
  # Matches when we have 3-tuple and first argument is a rectangle
  def area({:rectangle, a, b}) do
    a * b
  end

  # Matches when we have 2-tuple and first argument is a circle
  def area({:circle, r}) do
    r * r * 3.14
  end

  # Matches when we have 2-tuple and first argument is a square
  def area({:square, a}) do
    a * a
  end
end
