# My project for playing around with elixir

This project will probably have a lot of comments explaining basic concepts.
These are just for my own benefit to hammer it into my head.
I'm a new Alchemists.

# Notes

## Create new project

mix new hello_world

## Run a test

mix test

# IEX

```
iex                     # simple repl
iex -r file.ex          # load a file, then prompt
iex -S mix              # REPL with your project loaded
```

## IEX helpers

```
h Enum.map         # show docs ex. for Enum.map
i "hello"          # info about a value
exports Enum       # list public functions
recompile          # reload the project
h()                # Se all helpers
```

Opens an IEx shell inside a BEAM VM.

## IEX inline execution (e = evaluate)

```
iex -e "IO.puts(:hello)"
```

# Print docs for a spesific module

```
> iex
> h ExUnit.Case
```

# Intresting facts:

- The BEAM VM uses atoms as module names,

# Tuples

It's idiomatic Elixir to have what is called a tag tuple where the
first element is an atom and the second element is the payload.

```elixir
{:error, reason}    # 2-tuple, tagged (atom first)
{1, 2, 3}           # 3-tuple, untagged
{}                  # empty tuple, valid but rare in practice
```

```elixir
# Example of the pattern matching on a non empty list
# head always has a value, tail might be an empty list
def handle_call({:add, shape}, _from, [head | tail]) do
  #                                    ^^^^^^^^^^^^
  #                                    destructuring the state list
end
```

- Everything in Elixir is an expression with a return value, including constructors.

#iex:break

Reassignment or rebinding in Elixir terms assigns the value in a new location in memory.

In a module name like Geometry.Rectangle, There is nothing special about the dot character,
it's just another allowed character in a module name.

Placing a ? after a function is often used to indicate a function that returns either true or false.
Placing an ! character at the end of the name indicates a function that may raise a runtime error.

def and defmodule are not keywords, but macros.

If a function has no argument, it is allowed to omit the parentheses in the function definition. Although this is allowed according to Elixir in Action book, it's not a recommended practice.

# arity - the number of arguments a function takes
