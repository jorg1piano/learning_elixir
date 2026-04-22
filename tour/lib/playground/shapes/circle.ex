defmodule Shapes.Circle do
  defstruct [:radius]

  def area(%__MODULE__{radius: r}) do
    :math.pi() * r * r
  end
end

defimpl Shapes.Shape, for: Shapes.Circle do
  def area(circle), do: Shapes.Circle.area(circle)
end

defimpl String.Chars, for: Shapes.Circle do
  def to_string(%Shapes.Circle{radius: r}) do
    "Circle with radius #{r}"
  end
end
