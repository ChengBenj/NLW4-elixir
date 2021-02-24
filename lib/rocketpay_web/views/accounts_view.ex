defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.Account

  def render("update.json", %{ account: %Account{ balance: balance } }) do
    %{
      message: "Deposit done",
      balance: balance
    }
  end

end
