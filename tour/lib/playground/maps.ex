defmodule Maps do
  def new_literal, do: %{name: "Jorgen", age: 33}
  def tuple_constructed, do: Map.new([{:name, "Jorgen"}, {:age, 33}])
  def access_value_by_key, do: new_literal()[:name]
  # Map.get/3 allows you to specify a default value if the key is not found.
  def access_with_map_get, do: Map.get(new_literal(), :name, :not_found)
end
