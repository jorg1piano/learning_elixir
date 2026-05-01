# A simple version of a GenServer like thing
#
# functions called on the callback_module
#   callback_module.init()
#   callback_module.handle_call(request, current_state)
defmodule ServerProcess do
  def start(callback_module) do
    spawn(fn ->
      initial_state = callback_module.init()
      loop(callback_module, initial_state)
    end)
  end

  defp loop(callback_module, current_state) do
    receive do
      {request, caller_pid} ->
        {response, new_state} = callback_module.handle_call(request, current_state)

        send(caller_pid, {:response, response})

        loop(callback_module, new_state)
    end
  end

  def call(server_pid, request) do
    send(server_pid, {request, self()})

    receive do
      {:response, response} -> response
    end
  end
end

# iex(1)> pid = KeyValueStore.start()
# iex(2)> KeyValueStore.put(pid, :some_key, :some_value)
# iex(3)> KeyValueStore.get(pid, :some_key)

defmodule KeyValueStore do
  def init(), do: %{}

  def start do
    ServerProcess.start(KeyValueStore)
  end

  def put(pid, key, value) do
    ServerProcess.call(pid, {:put, key, value})
  end

  def get(pid, key) do
    ServerProcess.call(pid, {:get, key})
  end

  def handle_call({:put, key, value}, state) do
    {:ok, Map.put(state, key, value)}
  end

  def handle_call({:get, key}, state) do
    {Map.get(state, key), state}
  end
end
