# Solves a puzzle where we take in a list of turns on a dial
# in this format. The result of solve is the number
# of times the dial has landed on the number 0.c
# ```
# L42
# R25
# L24
# ```
defmodule SecretPassword do
  def solve(input_file, start_position) do
    File.read!(input_file)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn item ->
      case item do
        "L" <> number -> {:left, String.to_integer(number)}
        "R" <> number -> {:right, String.to_integer(number)}
      end
    end)
    |> find_password(start_position)
  end

  # The password is the number of times the dial has landed on the number 0
  # The dial can also be turned from 0 to 99 and from 99 to 0
  defp find_password(tagged_list_of_turns, start_position) do
    tagged_list_of_turns
    # position, count
    |> Enum.reduce({start_position, 0}, fn {direction, clicks}, {current_position, count} ->
      new_position = SecretPassword.step({direction, clicks}, current_position)
      {new_position, count + if(new_position == 0, do: 1, else: 0)}
    end)
    |> elem(1)
  end

  # 0 to 99
  @positions 100

  def step({:left, number}, current_position) do
    Integer.mod(current_position - number, @positions)
  end

  def step({:right, number}, current_position) do
    Integer.mod(current_position + number, @positions)
  end
end
