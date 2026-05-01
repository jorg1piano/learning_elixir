defmodule BankTransferTest do
  use ExUnit.Case
  doctest BankTransfer

  test "transfer amount lesss than or equal the balance succeeds" do
    assert BankTransfer.transfer_money("acc-1", "acc-2", 500) == {:ok, {:money_transfered, 500}}
  end

  test "transfer amounts higher than the balance fails" do
    assert BankTransfer.transfer_money("acc-1", "acc-2", 501) == {:error, :insufficient_funds}
  end

  test "passing negative amount fails" do
    assert BankTransfer.transfer_money("acc-1", "acc-2", -1) == {:error, :invalid_amount}
  end

  test "passing string as amount fails" do
    assert BankTransfer.transfer_money("acc-1", "acc-2", "should have been a number") ==
             {:error, :invalid_amount}
  end
end
