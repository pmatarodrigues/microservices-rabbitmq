defmodule Orderservice.SchemaTest do
  use Orderservice.DataCase

  alias Orderservice.Schema

  describe "order" do
    alias Orderservice.Schema.Order

    import Orderservice.SchemaFixtures

    @invalid_attrs %{create_on: nil, order_id: nil, total_price: nil}

    test "list_order/0 returns all order" do
      order = order_fixture()
      assert Schema.list_order() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Schema.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{create_on: ~D[2021-12-26], order_id: 42, total_price: 120.5}

      assert {:ok, %Order{} = order} = Schema.create_order(valid_attrs)
      assert order.create_on == ~D[2021-12-26]
      assert order.order_id == 42
      assert order.total_price == 120.5
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{create_on: ~D[2021-12-27], order_id: 43, total_price: 456.7}

      assert {:ok, %Order{} = order} = Schema.update_order(order, update_attrs)
      assert order.create_on == ~D[2021-12-27]
      assert order.order_id == 43
      assert order.total_price == 456.7
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_order(order, @invalid_attrs)
      assert order == Schema.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Schema.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Schema.change_order(order)
    end
  end
end
