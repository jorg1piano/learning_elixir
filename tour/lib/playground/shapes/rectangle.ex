defmodule Shapes.Rectangle do
  defstruct [:width, :height]

  def area(%__MODULE__{width: w, height: h}) do
    w * h
  end
end

defimpl Shapes.Shape, for: Shapes.Rectangle do
  def area(rect), do: Shapes.Rectangle.area(rect)
end

defimpl String.Chars, for: Shapes.Rectangle do
  def to_string(%Shapes.Rectangle{width: w, height: h}) do
    "Rectangle with width #{w} and height #{h}"
  end
end
