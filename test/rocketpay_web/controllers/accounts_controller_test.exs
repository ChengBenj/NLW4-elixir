defmodule RocketpayWeb.AccountsControllerTest do
  use RocketpayWeb.ConnCase, async: true

  alias Rocketpay.{Account, User}

  describe "deposit/2" do
    setup %{ conn: conn } do
      params = %{
        name: "Benjamin",
        password: "123456",
        nickname: "china",
        email: "benjaminscalabrin@gmail.com",
        age: 22
      }

      {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic YmFuYW5hOm5hbmljYTEyMw==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when_all_params are valid, do the deposit", %{ conn: conn, account_id: account_id } do
      params = %{ "value" => "50.00" }

      response = conn
       |> post(Routes.accounts_path(conn, :deposit, account_id, params))
       |> json_response(:ok)

      assert %{
        "balance" => "50.00",
        "message" => "Balance updated successfully"
      } = response
    end

    # test "when_all_params are not valid, don't the deposit", %{ conn: conn, account_id: account_id } do
    #   params = %{ "value" => "banana" }

    #   response = conn
    #    |> post(Routes.accounts_path(conn, :deposit, account_id, params))
    #    |> json_response(:bad_request)

    #   expected_response = %{"message" => "Invalid deposit"}

    #   assert expected_response == response
    # end
  end
end
