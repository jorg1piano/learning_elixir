defmodule Shapes.Circle do
  defstruct [:radius]

  def area(%__MODULE__{radius: r}) do
    :math.pi() * r * r
  end
end

defimpl Shapes.Shape, for: Shapes.Circle do
  def area(circle), do: Shapes.Circle.area(circle)
end
