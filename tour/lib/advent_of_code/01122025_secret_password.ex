defmodule SecretPassword do
  def solve(input_file) do
    input_file
    |> read_file()
    |> extract_list_from_file_contents()
    |> find_password()
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
  end

  # The password is the number of times the dial has landed on the number 0
  # The dial can also be turned from 0 to 99 and from 99 to 0
  defp find_password(list_of_turns) do
  end
end
