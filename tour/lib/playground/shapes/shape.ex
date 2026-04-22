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
  @moduledoc """
  Top-level operations on shapes
  """

  def save(shape, format) do
    serializer =
      case format do
        :json -> Shapes.Serializers.JsonSerializer
        :csv -> Shapes.Serializers.CsvSerializer
        _ -> raise "Unsupported format #{format}"
      end

    content = serializer.serialize(shape)
    File.write!("shape.#{serializer.extension()}", content)
  end
end
