defmodule GenServerCounter do
  use GenServer

  # start_link/1 is a convention for starting GenServers.
  # It takes an initial state and starts the GenServer process.
  # start_link is the standard entry point for any GenServer
  # meant to live under supervision
  @spec start_link(any()) :: :ignore | {:error, any()} | {:ok, pid()}
  def start_link(initial_count),
    # name: __MODULE__, registeres this pid as GenServerCounter
    do: GenServer.start_link(__MODULE__, initial_count, name: __MODULE__)

  def inc, do: GenServer.call(__MODULE__, :inc)
  def get, do: GenServer.call(__MODULE__, :get)

  ## GenServer callbacks

  @impl true
  def init(n), do: {:ok, n}

  @impl true
  # _from is a {pid, tag} tuple, when prefix with _from it means it is intentionally unused
  def handle_call(:inc, _from, count) do
    {:reply, count + 1, count + 1}
  end

  def handle_call(:get, _from, count) do
    {:reply, count, count}
  end
end
