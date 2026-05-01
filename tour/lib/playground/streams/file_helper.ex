defmodule FileHelper do
  def scan_lines_longer_than(file_path, length) do
    # Lazely do operations on a enumarable with a stream
    # This does the operations in a single pass
    # and never have to load the full file into memory
    File.stream!(file_path)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.filter(&(String.length(&1) > length))
  end
end
