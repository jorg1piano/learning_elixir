defmodule Todo.CacheTest do
  use ExUnit.Case
  doctest Todo.Cache

  test "server_process" do
    {:ok, cache} = Todo.Cache.start()
    jorgen_pid = Todo.Cache.server_process(cache, "jorgen")

    assert jorgen_pid != Todo.Cache.server_process(cache, "jonas")
    assert jorgen_pid == Todo.Cache.server_process(cache, "jorgen")
  end
end
