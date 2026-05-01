defmodule TodoListV4 do
  defstruct next_id: 1, entries: %{}

  def new(), do: %TodoListV4{}
end
