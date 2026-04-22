# My project for playing around with elixir

This project will probably have a lot of comments explaining basic concepts.
These are just for my own benefit to hammer it into my head.
I'm a new Alchemists.

# Notes

## Create new project

mix new hello_world

## Run a test

mix test

# IEX - Repl IEX (Interactive Elixir.)

```
iex
```

## IEX in project

```
iex -S mix
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
