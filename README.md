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

#

Aliases: Atoms can also be written as AnAtom, in which case it compiles to :"Elixir.AnAtom"

Booleans: They don't exist. true and false are syntactic sugar for :true and :false
Nil: `:nil == nil` evaluates to true

# Logical operations

```elixir
true and false
false or true
not false
```

# Truthynes

```elixir
nil || false || 5 || true # evaluates to 5
```

Similar to your JavaScript, Elixir has the concept of truthiness.
`or` and `and` are called strict boolean operators (or just boolean operators).
`||` and `&&` are called relaxed boolean operators (or short-circuit operators based on truthiness).

# Lists are recursive pairs of head and tail

```elixir
[1 | [2 | [3 | [4]]]]
```

evaulates to [1, 2, 3, 4]
The `|`is the cons operator (short for "construct").
It separates the head (first element) from the tail (rest of the list).

O(1) timecomplexity

```elixir
a_list = [1, 2, 3]
new_list = [0 | a_list]
```

Because of the recursive nature of lists, there is no copying involved when prepending to a list in this way.

```elixir
elixira_list = [1, 2, 3]
new_list = a_list ++ [4]
```

When appending like this, Elixir must traverse the entire a_list and rebuild every "cons cell", because the final node of a_list points to [] and needs to be replaced with a pointer to [4]. Since lists are immutable, the original can't be m odified — a new list is constructed. This makes appending O(n) in both time and space.

Elixir does not have a dedicated string type. Strings are binaries.
