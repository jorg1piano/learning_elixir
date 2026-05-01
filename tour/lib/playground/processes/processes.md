# A single blocking query

```elixir
run_query = fn query_def ->
    Process.sleep(2000)
        "#{query_def} result"
end
```

# 5 blocking requests

```elixir
Enum.map(
    1..5,
    fn index ->
        query_def = "query #{index}"
        run_query.(query_def)
    end
)
```

# Spawn a process

Returns a PID immediately, then returns the query result after 2 seconds.

```elixir
spawn (fn ->
    query_result = run_query.("query 1")
    IO.puts(query_result)
    end
)
```

# async query

```elixir
async_query = fn query_def ->
                spawn(fn ->
                    query_result = run_query.(query_def)
                    IO.puts(query_result)
                    end)
              end


```

# Run multiple async queries

```elixir
Enum.each(1..5, &async_query.("query #{&1}"))
```

```result of calling above
:ok
query 1 result
query 2 result
query 3 result
query 4 result
query 5 result
```

# Send message to process

Places a message in the process "mailbox" in a FIFO manner

```elixir
send(pid, {:an, :arbitrary, :term})
```

# Pick up messages in mailbox

```elixir
receive do
    pattern_1 -> do_something
    pattern_2 -> do_something_else
end
```

# Send message to self

```elixir
iex(1)> send(self(), "Hello from caller")
iex(2)> receive do
            message -> IO.inspect(message)
        end
```

Send two messages, then pick up both messages from the mailbox.

```elixir
iex(1)> send(self(), {:message, "hello"})
iex(2)> send(self(), {:signal, :start})
iex(3)> receive do
            {:message, msg} -> IO.puts("received message #{msg}")
            {:signal, signal} -> IO.puts("received signal #{signal}")
        end
iex(4)> receive do
            {:message, msg} -> IO.puts("received message #{msg}")
            {:signal, signal} -> IO.puts("received signal #{signal}")
        end
```

# Collecting query results

```elixir
# run a query that simulates some work
iex(1)> run_query =
            fn query_def ->
                Process.sleep(2000)
                "#{query_def} result"
            end
# runs run_query async in another process, query_def is captured by the closure mechanism and is copied ower into the process
iex(2)> async_query =
            fn query_def ->
                caller = self()
                spawn(fn ->
                    query_result = run_query.(query_def)
                    send(caller, {:query_result, query_result})
                    end)
            end
# Spin of 5 async queries, async_query sends message back to the caller
iex(3)> Enum.each(1..5, &async_query.("query #{&1}"))
# Get the result from the mailbox
iex(4)> get_result =
            fn ->
                receive do
                    {:query_result, result} -> result
                end
            end
# Pick of message from the mailbox into a single list
iex(5)> results = Enum.map(1..5, fn _ -> get_result.() end)

# Expressed as a single pipeline
iex(6)> 1..5
        # Do queries in another process
        |> Enum.map(&async_query.("query #{&1}"))
        # Collect the results
        |> Enum.map(fn _-> get_result.() end)
```
