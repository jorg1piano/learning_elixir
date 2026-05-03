# Illustrates how the "system" using Supervisor
# can be launched through a nice interface.
# iex(1)> Todo.System.start_link()
defmodule Todo.System do
  def start_link do
    Supervisor.start_link(
      [Todo.Cache],
      strategy: :one_for_one
    )
  end
end
