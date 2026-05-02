defmodule Todo.Server do
  use GenServer

  def start(name) do
    GenServer.start(__MODULE__, name)
  end

  def add_entry(pid, entry), do: GenServer.cast(pid, {:add_entry, entry})

  def entries(pid), do: GenServer.call(pid, :entries)

  @impl true
  def init(name) do
    {:ok, {name, nil}, {:continue, :init}}
  end

  @impl true
  def handle_continue(:init, {name, nil}) do
    todo_list = Todo.Database.get(name) || Todo.List.new()
    {:noreply, {name, todo_list}}
  end

  @impl true
  def handle_cast({:add_entry, entry}, {name, todo_list}) do
    new_list = Todo.List.add_entry(todo_list, entry)
    Todo.Database.store(name, new_list)
    {:noreply, {name, new_list}}
  end

  @impl true
  def handle_call(:entries, _from, {_name, todo_list} = state) do
    {:reply, Todo.List.entries(todo_list), state}
  end
end
