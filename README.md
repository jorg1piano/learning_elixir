# My project for playing around with elixir

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
