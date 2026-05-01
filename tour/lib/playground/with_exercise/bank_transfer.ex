# Practicing "with" more
defmodule BankTransfer do
  def transfer_money(from_account_id, to_account_id, amount) do
    with {:ok, from_account} <- find_account(from_account_id),
         {:ok, _} <- find_account(to_account_id),
         :ok <- check_balance(from_account, amount) do
      {:ok, {:money_transfered, amount}}
    end
  end

  defp check_balance(account, amount) when account.balance >= amount, do: :ok
  defp check_balance(_account, _amount), do: {:error, :insufficient_funds}

  # Simulating a database
  @accounts %{
    "acc-1" => %{id: "acc-1", balance: 500},
    "acc-2" => %{id: "acc-2", balance: 100},
    "acc-3" => %{id: "acc-3", balance: 0}
  }

  defp find_account(id) do
    case Map.fetch(@accounts, id) do
      {:ok, account} -> {:ok, account}
      :error -> {:error, :account_not_found}
    end
  end
end
