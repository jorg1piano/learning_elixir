# iex(0)|> ProcessLink.linkedProccess
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
end
