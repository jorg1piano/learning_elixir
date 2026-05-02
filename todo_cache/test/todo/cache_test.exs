defmodule Todo.CacheTest do
  use ExUnit.Case
  doctest Todo.Cache

  test "server_process" do
    {:ok, cache} = Todo.Cache.start()
    jorgen_pid = Todo.Cache.server_process(cache, "jorgen")

    assert jorgen_pid != Todo.Cache.server_process(cache, "jonas")
    assert jorgen_pid == Todo.Cache.server_process(cache, "jorgen")
  end

  test "to-do operations" do
    {:ok, cache} = Todo.Cache.start()
    alice = Todo.Cache.server_process(cache, "alice")
    Todo.Server.add_entry(alice, %{title: "Dentist"})

    entries = Todo.Server.entries(alice)
    assert %{1 => %{id: 1, title: "Dentist"}} = entries
  end
end
