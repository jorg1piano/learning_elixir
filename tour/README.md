# Tour

Project to explore different elixir language concepts

# Aliases

```
alias Shapes.{Circle, Rectangle, Shape} # Creates Circle, Rectangle, Shape
```

# Behaviours VS protocols

- Many data types, one operation → protocol
  ie. "Compute area for any shape value"
- Many modules, one contract → behaviour
  ie. "Any serializer module must have serialize/1 and extension/0"

# Use + Behaviours

```
# use
#   - Registers @behaviour for you
#   - Provides default implementations of optional callbacks so you only override what you need
#   - Can inject additional imports/aliases
defmodule Counter do
  use GenServer   # behaviour + defaults + imports
  # only implement what you care about
  @impl true
  def init(n), do: {:ok, n}
end
```

# inspect behaviours at runtime

```ex
Shapes.Serializer.behaviour_info(:callbacks)
# output:
# iex(1)> Shapes.Serializer.behaviour_info(:callbacks)
# [serialize: 1, extension: 0]
```

# Atoms

There is a limit of max number of atoms set to 1,048,576. If you exceed this, the BEAM vm crashes.
Atoms are not garbage collected and when traded, they stay around in the VM forever.
This is the reason why, despite my intuition of wanting to use atoms for events,
for instance in a Phoenix Live View template, I often see older people use strings in code examples and tutorials.
