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
