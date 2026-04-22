defmodule Shapes.Rectangle do
  defstruct [:width, :height]

  def area(%__MODULE__{width: w, height: h}) do
    w * h
  end
end

defimpl Shapes.Shape, for: Shapes.Rectangle do
  def area(rect), do: Shapes.Rectangle.area(rect)
end
