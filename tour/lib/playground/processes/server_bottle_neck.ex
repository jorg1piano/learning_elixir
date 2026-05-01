# Demonstrate a bottle neck
# iex(1)> server_pid = ServerBottleNeck.start()
# iex(2)> Enum.each(
#   1..5,
#   fn i ->
#     spawn(fn ->
#       IO.puts("Sending msg ##{i}")
#       response = ServerBottleNeck.send_msg(server_pid, i)
#       IO.puts("Response: #{response}")
#     end)
#   end
# )
defmodule ServerBottleNeck do
  def start() do
    spawn(fn -> loop() end)
  end

  def send_msg(server, msg) do
    send(server, {self(), msg})

    receive do
      {:response, response} -> response
    end
  end

  def loop() do
    receive do
      {caller_pid, msg} ->
        Process.sleep(1000)
        send(caller_pid, {:response, msg})
    end

    loop()
  end
end
