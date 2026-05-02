defmodule Todo.Database do
  use GenServer

  @db_folder "./persist"

  def start do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def store(key, data) do
    GenServer.cast(__MODULE__, {:store, key, data})
  end

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  defp start_worker do
    {:ok, pid} = Todo.DatabaseWorker.start("./persist")
    pid
  end

  defp choose_worker(key, state) do
    Map.get(state, :erlang.phash2(key, 3))
  end

  @impl true
  def init(_) do
    File.mkdir_p!(@db_folder)

    workers =
      0..2
      |> Enum.map(fn i -> {i, start_worker()} end)
      |> Map.new()

    {:ok, workers}
  end

  @impl true
  def handle_cast({:store, key, data}, state) do
    worker_pid = choose_worker(key, state)

    GenServer.cast(worker_pid, {:store, key, data})
    {:noreply, state}
  end

  @impl true
  def handle_call({:get, key}, _from_ref, state) do
    worker_pid = choose_worker(key, state)
    data = GenServer.call(worker_pid, {:get, key})

    {:reply, data, state}
  end
end
