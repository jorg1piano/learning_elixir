defmodule Maps do
  def new_literal, do: %{name: "Jorgen", age: 33}
  def tuple_constructed, do: Map.new([{:name, "Jorgen"}, {:age, 33}])
  def access_value_by_key, do: new_literal()[:name]
  # Map.get/3 allows you to specify a default value if the key is not found.
  def access_with_map_get, do: Map.get(new_literal(), :name, :not_found)

  # Map.fetch/2 returns a tuple {:ok, value} if the key is found, or :error if it is not.
  def access_with_fetch, do: Map.fetch(new_literal(), :name)
  def access_with_fetch_not_found, do: Map.fetch(new_literal(), :non_existing_key)
end
