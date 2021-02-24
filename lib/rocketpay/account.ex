defmodule Rocketpay.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, Rocketpay.User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
      |> cast(params, @required_params)
      |> validate_required(@required_params)
      |> validate_number(:balance, greater_than_or_equal_to: 0)
      # |> check_constraint(:balance, name: :balance_must_be_positive_or_zero)
      # Quando tiver constraint, usar o `check_constraint`
  end
end
