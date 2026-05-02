# Project for making a distributed TODO list

## Running 100 000 processes

```elixir
iex()> {:ok, cache} = Todo.Cache.start()
iex()> length(Process.list())
iex()> Enum.each(
        1..100_000,
        fn index ->
          Todo.Cache.server_process(cache, "todo list #{index}")
        end
       )
iex()> length(Process.list())


iex(2)> {:ok, cache} = Todo.Cache.start()
{:ok, #PID<0.149.0>}
iex(3)> length(Process.list())
72
iex(4)> Enum.each(
         1..100_000,
         fn index ->
           Todo.Cache.server_process(cache, "todo list #{index}")
         end
        )
:ok
iex(6)> length(Process.list())
100072

```
