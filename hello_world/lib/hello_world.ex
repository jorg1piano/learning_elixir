defmodule HelloWorld do
  @moduledoc """
  Documentation for `HelloWorld`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> HelloWorld.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Greets the given name.

  ## Examples

      iex> HelloWorld.greet("Jorgen")
      "Hello, Jorgen!"

  """
  def greet(name) when is_binary(name) do
    "Hello, #{name}!"
  end
end
