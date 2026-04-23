defmodule SecretPassword do
  def solve(input_file) do
    input_file
    |> read_file()
    |> extract_list_from_file_contents()
    |> tagged_list_of_turns()
    |> find_password()
  end

  # 0 to 99
  @positions 100

  def step({:left, number}, current_position) do
    rem(current_position - number + @positions, @positions)
  end

  def step({:right, number}, current_position) do
    rem(current_position + number, @positions)
  end

  # A file with a list of turns separated by newlines.
  # L10\nR20 etc...
  defp read_file(input_file) do
    File.read!(input_file)
  end

  defp extract_list_from_file_contents(file_contents) do
    file_contents
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn item -> {:left, item} end)
  end

  def tagged_list_of_turns(list_of_turns) do
    list_of_turns
    |> Enum.map(fn item ->
      case item do
        "L" <> number -> {:left, String.to_integer(number)}
        "R" <> number -> {:right, String.to_integer(number)}
      end
    end)
  end

  # The password is the number of times the dial has landed on the number 0
  # The dial can also be turned from 0 to 99 and from 99 to 0
  defp find_password(list_of_turns) do
  end
end
