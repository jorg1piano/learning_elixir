# .t() is a community convention (borrowed from Erlang/OCaml) so that
# any module which represents a data type exposes its main type as t.
defmodule Shapes.Serializer do
  # Take something that satisfies the Shape protocol and serialize it to a string.
  # @callback declares a function that implementers must provide
  # Type annotations are required (unlike @spec)
  @callback serialize(shape :: Shapes.Shape.t()) :: String.t()
  @callback extension() :: String.t()
end
