defmodule DatabaseServer do
  # "interface function" to start the server
  def start do
    spawn(&loop/0)
  end

  defp loop do
    receive do
      # do some work
    end

    # Constant stack space, tail call optimization will be applied
    # This is despites its looks, not cpu heavy
    loop()
  end
end
