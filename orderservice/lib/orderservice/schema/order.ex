defmodule Orderservice.Schema.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order" do
    field :create_on, :date
    field :order_id, :integer
    field :total_price, :float

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:order_id, :create_on, :total_price])
    |> validate_required([:order_id, :create_on, :total_price])
  end
end
