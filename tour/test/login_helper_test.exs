defmodule LoginHelperTest do
  use ExUnit.Case
  doctest LoginHelper

  describe "extract user and email" do
    creds = %{email: "test@test.no", password: "secret_password"}

    expect = %{
      email: "test@test.no",
      password: "secret_password"
    }

    assert LoginHelper.extract_user(creds) == {:ok, expect}
  end

  describe "extract email" do
    test "returns {:ok, email} when present in map" do
      creds = %{email: "test@test.no"}
      assert LoginHelper.extract_email(creds) == {:ok, "test@test.no"}
    end

    test "return {:error, reason} when email is missing" do
      assert LoginHelper.extract_email(%{}) == {:error, "email missing"}
    end
  end

  describe "extract password" do
    test "resturns {:ok, password} when present in map" do
      creds = %{password: "secret_password"}
      assert LoginHelper.extract_password(creds) == {:ok, "secret_password"}
    end

    test "returns {:error, reason} when password is missing" do
      assert LoginHelper.extract_password(%{}) == {:error, "password missing"}
    end
  end
end
