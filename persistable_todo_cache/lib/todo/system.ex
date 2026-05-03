# Illustrates how the "system" using Supervisor
# can be launched through a nice interface.
# iex(1)> Todo.System.start_link()
# iex(2)> Todo.Cache.server_process("bob's list")
# iex(3)> Process.exit(Process.whereis(Todo.Cache), :kill)
# iex(4)> Todo.Cache.server_process("bob's list")

defmodule Todo.System do
  use Supervisor

  def start_link do
    # Start the supervisor as this __MODULE__ as the callback module see init/1
    Supervisor.start_link(__MODULE__, nil)
  end

  def init(_) do
    Supervisor.init([Todo.Cache], strategy: :one_for_one)
  end
end
