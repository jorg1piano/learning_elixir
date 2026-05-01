defmodule Comprehensions do
  def multiply_self() do
    for x <- [1, 2, 3] do
      # returns: [1, 4, 9]
      x * x
    end
  end

  def add_1() do
    for x <- [1, 2, 3] do
      # [2, 3, 4]
      x + 1
    end
  end

  def multiplication_table() do
    for x <- [1, 2, 3], y <- [1, 2, 3] do
      # Iterates x and y, with y changing fastest:
      # (1,1), (1,2), (1,3), (2,1), (2,2), (2,3), (3,1), (3,2), (3,3)
      # Each iteration produces a tuple, and `for` collects them all into a list.
      {x, y, x * y}
    end
  end
end
