defmodule LoginHelperTest do
  use ExUnit.Case
  doctest LoginHelper

  test "returns email when present in map" do
    creds = %{email: "test@test.no"}
    assert LoginHelper.extract_email(creds) == {:ok, "test@test.no"}
  end

  test "return {:error, reason} when email is missing" do
    assert LoginHelper.extract_email(%{}) == {:error, "email missing"}
  end

  test "resturns password when present in map" do
    creds = %{password: "secret_password"}
    assert LoginHelper.extract_password(creds) == {:ok, "secret_password"}
  end

  test "returns {:error, reason} when password is missing" do
    assert LoginHelper.extract_password(%{}) == {:error, "password missing"}[j]
  end
end
