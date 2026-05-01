defmodule FileHelper do
  def scan_lines_longer_than(file_path, length) do
    # Lazely do operations on a enumarable with a stream
    File.stream!(file_path)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.filter(&(String.length(&1) > length))
  end
end
