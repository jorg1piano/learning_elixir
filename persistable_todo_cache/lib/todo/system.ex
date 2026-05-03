# Illustrates how the "system" using Supervisor
# can be launched through a nice interface.
#
# Here we prove that the the linking between system -> cache -> database -> database worker
# all functions. The number of processes remains unchanged.
# The old processes where killed, and new ones where started in their place.
#
# iex(1)> Todo.System.start_link()
# Starting to-do cache
# Starting Todo.Database
# Starting Todo.DatabaseWorker
# Starting Todo.DatabaseWorker
# Starting Todo.DatabaseWorker
# {:ok, #PID<0.156.0>}
#
# iex(2)> Todo.Cache.server_process("bob's list")
# #PID<0.162.0>
# iex(3)> length(Process.list())
# 78
#
# iex(4)> Process.exit(Process.whereis(Todo.Cache), :kill)
# true
# Starting to-do cache
# Starting Todo.Database
# Starting Todo.DatabaseWorker
# Starting Todo.DatabaseWorker
# Starting Todo.DatabaseWorker
#
# iex(5)> Todo.Cache.server_process("bob's list")
# #PID<0.168.0>
#
# iex(6)> length(Process.list())
# 78
#
# Restart frequency
# iex(1)> Todo.System.start_link()
# iex(2)> for _ <- 1..4 do
#           Process.exit(Process.whereis(Todo.Cache), :kill)
#           Process.sleep(200)
#         end
# Restarts repeatedly, then
# ** (EXIT from #PID<0.147.0>) shell process exited with reason: shutdown

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
