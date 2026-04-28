defmodule CaseExpressions do
  def max_num(a, b) do
    case a >= b do
      true -> a
      false -> b
    end
  end
end
