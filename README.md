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
