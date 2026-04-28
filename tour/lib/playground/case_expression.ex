defmodule CaseExpressions do
  def max_num(a, b) do
    case a >= b do
      true -> a
      false -> b
    end
  end

  # Returns :stop, :slow_down, :go or :unknown_signal
  def trafic_light(color) do
    case color do
      "red" -> :stop
      "yellow" -> :slow_down
      "green" -> :go
      _ -> :unknown_signal
    end
  end

  # "add 5 3" → {:ok, :add, 5, 3}
  # "subtract 10 4" → {:ok, :subtract, 10, 4}
  # "multiply 2 6" → {:ok, :multiply, 2, 6}
  # "divide 10 2" → {:ok, :divide, 10, 2}
  # "divide 10 0" → {:error, "cannot divide by zero"}
  def command_parser(command_str) do
    parts = String.split(command_str)

    case parts do
      ["add", a, b] ->
        {num_a, _} = Integer.parse(a)
        {num_b, _} = Integer.parse(b)
        {:ok, :add, num_a, num_b}

      ["subtract", a, b] ->
        {num_a, _} = Integer.parse(a)
        {num_b, _} = Integer.parse(b)
        {:ok, :subtract, num_a, num_b}

      ["multiply", a, b] ->
        {num_a, _} = Integer.parse(a)
        {num_b, _} = Integer.parse(b)
        {:ok, :multiply, num_a, num_b}

      # Could also have been expressed like
      # ["divide", _a, "0"] -> {:error, "cannot divide by zero"}
      # ["divide", a, b] -> {:ok, :divide, String.to_integer(a), String.to_integer(b)}
      ["divide", a, b] ->
        {num_a, _} = Integer.parse(a)
        {num_b, _} = Integer.parse(b)

        cond do
          num_b == 0 -> {:error, "cannot divide by zero"}
          true -> {:ok, :divide, num_a, num_b}
        end
    end
  end
end
