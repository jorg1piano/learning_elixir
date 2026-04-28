defmodule LoginHelper do
  def extract_user(user) do
    # The with block returns the value of the first clause that fails to match its pattern.
    # If every clause matches, the do block is executed.
    with {:ok, email} <- extract_email(user),
         {:ok, password} <- extract_password(user) do
      {:ok, %{email: email, password: password}}
    end
  end

  def extract_email(%{email: email}), do: {:ok, email}
  def extract_email(_), do: {:error, "email missing"}

  def extract_password(%{password: password}), do: {:ok, password}
  def extract_password(_), do: {:error, "password missing"}
end
