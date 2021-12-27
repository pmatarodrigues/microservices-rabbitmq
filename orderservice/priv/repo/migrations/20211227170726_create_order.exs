defmodule Orderservice.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:order) do
      add :order_id, :integer
      add :create_on, :date
      add :total_price, :float

      timestamps()
    end
  end
end
