defmodule OrderserviceWeb.OrderView do
  use OrderserviceWeb, :view
  alias OrderserviceWeb.OrderView

  def render("index.json", %{order: order}) do
    %{data: render_many(order, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{
      id: order.id,
      order_id: order.order_id,
      create_on: order.create_on,
      total_price: order.total_price
    }
  end
end
