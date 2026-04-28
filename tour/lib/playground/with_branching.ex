defmodule LoginHelper do
  def extract_email(%{email: email}), do: {:ok, email}
  def extract_email(_), do: {:error, "email missing"}

  def extract_password(%{password: password}), do: {:ok, password}
  def extract_password(_), do: {:error, "password missing"}
end
