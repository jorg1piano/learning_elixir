defprotocol Shapes.Shape do
  @doc "Return the area of a shape"
  # t() is an Elixir convention: the main type a module defines.
  @spec area(t()) :: number()

  def area(shape)
end
