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
end
