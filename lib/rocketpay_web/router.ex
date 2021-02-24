defmodule RocketpayWeb.Router do
  use RocketpayWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RocketpayWeb do
    pipe_through :api

    get "/:filename", WelcomeController, :index

    post "/users", UsersController, :create
    post "/accounts/:id/deposit", AccountsController, :deposit
    # post "/accounts/:id/withdraw", AccountsController, :withdraw
  end
end
