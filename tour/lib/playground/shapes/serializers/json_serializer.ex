# A behaviour is a compile-time-checked contract declaring which functions a module must implement,
# so that unrelated modules can be used interchangeably as swappable strategies.
defmodule Shapes.Serializers.JsonSerializer do
  @behaviour Shapes.Serializer

  @impl true
  def serialize(%Shapes.Circle{radius: r}),
    # ~s is a sigil for string literals, it allows interpolation and multi-line strings without escaping
    # sigil (a symbolic mark), sigils all start with ~
    do: ~s({"type":"circle","radius":#{r}})

  @impl true
  def serialize(%Shapes.Rectangle{width: w, height: h}),
    do: ~s({"type":"rectangle","width":#{w},"height":#{h}})

  @impl true
  def extension() do
    "json"
  end
end
