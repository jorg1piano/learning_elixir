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
