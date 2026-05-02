# iex(1)> TodoGenServer.start()
# iex(2)> TodoGenServer.add_entry(%{title: "Peanutes"})
# iex(3)> TodoGenServer.entries()
# iex(4)> TodoGenServer.start()
defmodule TodoGenServer do
  use GenServer

  def start do
    case GenServer.start(__MODULE__, nil, name: __MODULE__) do
      {:ok, pid} -> {:ok, pid}
      {:error, {:already_started, pid}} -> {:ok, pid}
      error -> error
    end
  end

  def add_entry(entry), do: GenServer.cast(__MODULE__, {:add_entry, entry})

  def entries(), do: GenServer.call(__MODULE__, :entries)

  @impl true
  def init(_) do
    {:ok, TodoListFinal.new()}
  end

  @impl true
  def handle_cast({:add_entry, entry}, state) do
    {:noreply, TodoListFinal.add_entry(state, entry)}
  end

  @impl true
  def handle_call(:entries, _from, state) do
    {:reply, TodoListFinal.entries(state), state}
  end
end
