defmodule Orderservice.SchemaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Orderservice.Schema` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        create_on: ~D[2021-12-26],
        order_id: 42,
        total_price: 120.5
      })
      |> Orderservice.Schema.create_order()

    order
  end
end
