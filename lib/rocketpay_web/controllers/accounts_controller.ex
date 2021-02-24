defmodule RocketpayWeb.AccountsController do
  use RocketpayWeb, :controller

  alias Rocketpay.Account

  action_fallback RocketpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Rocketpay.deposit(params) do
      IO.inspect("Entrei")
      conn
      |> put_status(:ok)
      |> IO.inspect
      |> render("update.json", account: account)
    end
  end

  # def withdraw(conn, params) do
  #   with {:ok, %User{} = account} <- Rocketpay.withdraw(params) do
  #     IO.inspect("Entrei")
  #     conn
  #     |> put_status(:ok)
  #     |> render("create.json", account: account)
  #   end
  # end
end
