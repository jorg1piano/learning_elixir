defmodule LetterCounter do
  def get_n_letter_words(n, input_file_path) do
    with {:ok, contents} <- File.read(input_file_path),
         lines <- String.split(contents, "\n"),
         n_word_list <- Enum.filter(lines, &(String.length(&1) == n)) do
      {:ok, n_word_list}
    end
  end
end
