# GenServer

A behaviour in the OTP (Open Telecom Platform) standard library. It's just a behaviour whose contract happens to describe a server's lifecycle.

Captures the generic "server process" pattern: hold state, receive messages, reply

# Processes

- Cheap: ~2kb each, millions pr VM
- Actor model, not shared memory, communicate through messages

```iex
# Spawn a new process
pid = spawn(fn ->
  receive do
    {:hello, from} -> send(from, :world)
  end
end)

# Send hello into the process, self() is the currents process pid
send(pid, {:hello, self()})

# Pull out a message from the "mailbox"
receive do
  :world -> IO.puts("got world")
end
```
