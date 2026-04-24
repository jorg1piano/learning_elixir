defmodule Maps do
  def new_literal, do: %{name: "Jorgen", age: 33}
  def tuple_constructed, do: Map.new([{:name, "Jorgen"}, {:age, 33}])
  def access_value_by_key, do: new_literal()[:name]
end
