# iex(1)|> ProcessErrors.unaffected_process()
defmodule ProcessErrors do
  def unaffected_process do
    spawn(fn ->
      spawn(fn ->
        Process.sleep(1000)
        IO.puts("Process 2 finished")
      end)

      raise("Something went wrong")
    end)

    Process.sleep(2000)

    IO.puts("all good in the nabourhood")
  end
end
