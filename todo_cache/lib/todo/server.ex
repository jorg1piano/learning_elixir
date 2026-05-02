defmodule Todo.Server do
  use GenServer

  def start do
    GenServer.start(__MODULE__, nil)
  end

  def add_entry(pid, entry), do: GenServer.cast(pid, {:add_entry, entry})

  def entries(pid), do: GenServer.call(pid, :entries)

  @impl true
  def init(_) do
    {:ok, Todo.List.new()}
  end

  @impl true
  def handle_cast({:add_entry, entry}, state) do
    {:noreply, Todo.List.add_entry(state, entry)}
  end

  @impl true
  def handle_call(:entries, _from, state) do
    {:reply, Todo.List.entries(state), state}
  end
end
