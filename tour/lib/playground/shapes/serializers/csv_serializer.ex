defmodule Shapes.Serializers.CsvSerializer do
  @behaviour Shapes.Serializer

  @impl true
  def serialize(%Shapes.Circle{radius: r}),
    do: "circle,#{r}"

  @impl true
  def serialize(%Shapes.Rectangle{width: w, height: h}),
    do: "rectangle,#{w},#{h}"

  @impl true
  def extension() do
    "csv"
  end
end
