# iex(0)|> ProcessLink.linkedProccess
# iex(1)|> ProcessLink.trapping_exit
defmodule ProcessLink do
  def linkedProccess() do
    spawn(fn ->
      # spawn_link spawns a new process an links it to the current one.
      # If either go down, the other follows
      spawn_link(fn ->
        # this process is taken down before we can print "process 2 finished"
        Process.sleep(1000)
        IO.puts("Process 2 finished")
      end)

      raise("something went wrong")
    end)
  end

  def trapping_exit do
    spawn(fn ->
      # Sets a flag on the current process to "trap" the exit
      # The exit becomes a regular message in the process inbox ({:EXIT, pid, reason}).
      Process.flag(:trap_exit, true)

      # This raised message gets sent to the mailbox
      spawn_link(fn -> raise("Something went wrong") end)

      receive do
        # print the raised error
        {:EXIT, pid, reason} ->
          IO.inspect("Process #{inspect(pid)} crashed, reason: #{inspect(reason)}")
      end
    end)

    Process.sleep(1000)
    IO.puts("caller still alive")
  end
end
