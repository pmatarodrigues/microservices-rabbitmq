defmodule OrderserviceWeb.OrderController do
  use OrderserviceWeb, :controller

  alias Orderservice.Schema
  alias Orderservice.Schema.Order

  action_fallback OrderserviceWeb.FallbackController

  def index(conn, _params) do
    order = Schema.list_order()
    render(conn, "index.json", order: order)
  end

  def create(conn, %{"order" => order_params}) do
    with {:ok, %Order{} = order} <- Schema.create_order(order_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.order_path(conn, :show, order))
      |> render("show.json", order: order)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Schema.get_order!(id)
    render(conn, "show.json", order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Schema.get_order!(id)

    with {:ok, %Order{} = order} <- Schema.update_order(order, order_params) do
      render(conn, "show.json", order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Schema.get_order!(id)

    with {:ok, %Order{}} <- Schema.delete_order(order) do
      send_resp(conn, :no_content, "")
    end
  end
end
