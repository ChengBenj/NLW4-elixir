defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Benjamin",
        password: "123456",
        nickname: "china",
        email: "benjaminscalabrin@gmail.com",
        age: 22
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      user = Repo.get(User, user_id);

      assert %User{ name: "Benjamin", age: 22, id: ^user_id} = user
    end

    test "when all params are not valid, returns an error" do
      params = %{
        name: "Benjamin",
        # password: "123456",
        nickname: "china",
        email: "benjaminscalabrin@gmail.com",
        age: 22
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
