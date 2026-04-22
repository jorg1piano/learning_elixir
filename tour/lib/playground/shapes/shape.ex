# To get a list of implements in iex we can run
# ```ex
#  Shapes.Shape.__protocol__(:impls)
# ```
defprotocol Shapes.Shape do
  @doc "Return the area of a shape"
  # t() is an Elixir convention: the main type a module defines.
  @spec area(t()) :: number()

  # `mix dialyzer` can be used to flag
  #     - Callers passing the wrong type
  #     - Impls returning the wrong type
  #     - Unreachable patterns

  def area(shape)
end

defmodule Shapes do
  @moduledoc "Top-level operations on shapes."

  @formats %{
    json: Shapes.Serializers.JsonSerializer,
    csv: Shapes.Serializers.CsvSerializer
  }

  @type format_tag :: :json | :csv

  @spec save(Shapes.Shape.t(), format_tag() | module()) :: :ok
  def save(shape, format) when format in [:json, :csv] do
    serializer = Map.fetch!(@formats, format)
    save(shape, serializer)
  end

  def save(shape, serializer) when is_atom(serializer) do
    content = serializer.serialize(shape)
    File.write!("shape.#{serializer.extension()}", content)
  end
end
