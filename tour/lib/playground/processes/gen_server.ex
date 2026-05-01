# iex(1)> {:ok, pid} = KeyValueStoreV2.start()
# iex(2)> KeyValueStoreV2.put(pid, "age", 33)
# iex(3)> KeyValueStoreV2.get(pid, "age")
defmodule KeyValueStoreV2 do
  use GenServer

  def start, do: GenServer.start(KeyValueStoreV2, nil)
  def put(pid, key, value), do: GenServer.cast(pid, {:put, key, value})
  def get(pid, key), do: GenServer.call(pid, {:get, key})

  # Genserver overrides
  def init(_), do: {:ok, %{}}

  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end
end
