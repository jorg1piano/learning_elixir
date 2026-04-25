# This file has the extension .exs, which means it is a script file.
# It can be run with the command `elixir script_example.exs` in the terminal.
defmodule PrintSomeStuff do
  def run do
    IO.puts("Hello World")
  end
end

# Invoke the function so something actually happens when we run the script.
PrintSomeStuff.run()
