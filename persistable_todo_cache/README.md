# Project for making a distributed TODO list

## Proving our persisted cache and database worker works

```elixir
{:ok, cache} = Todo.Cache.start()

bobs_list = Todo.Cache.server_process(cache, "bobs_list")

Todo.Server.add_entry(bobs_list, %{date: ~D[2023-12-19], title: "Dentist"})
Todo.Server.add_entry(bobs_list, %{date: ~D[2023-12-20], title: "Groceries"})
Todo.Server.add_entry(bobs_list, %{date: ~D[2023-12-19], title: "Movies"})

Todo.Server.entries(bobs_list)

alices_list = Todo.Cache.server_process(cache, "alices_list")
Todo.Server.add_entry(alices_list, %{date: ~D[2023-12-19], title: "Yoga"})

charlies_list = Todo.Cache.server_process(cache, "charlies_list")
Todo.Server.add_entry(charlies_list, %{date: ~D[2023-12-19], title: "Run"})

File.ls!("./persist")

:erlang.phash2("bobs_list", 3)
:erlang.phash2("alices_list", 3)
:erlang.phash2("charlies_list", 3)

{:ok, cache} = Todo.Cache.start()
bobs_list = Todo.Cache.server_process(cache, "bobs_list")
Todo.Server.entries(bobs_list)
```
