# iex(1)> {:ok, pid} = KeyValueStoreV2.start()
# iex(2)> KeyValueStoreV2.put(pid, "age", 33)
# iex(3)> KeyValueStoreV2.get(pid, "age")
# A key-value store that deletes its internal state every 60 seconds
defmodule KeyValueStoreV2 do
  use GenServer

  def start, do: GenServer.start(KeyValueStoreV2, nil)
  def put(pid, key, value), do: GenServer.cast(pid, {:put, key, value})
  def get(pid, key), do: GenServer.call(pid, {:get, key})

  # Genserver overrides
  def init(_) do
    :timer.send_interval(60_000, :cleanup)
    {:ok, %{}}
  end

  def handle_info(:cleanup, _state) do
    {:noreply, %{}}
  end

  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end
end
