defmodule FrontendWeb.MqpageController do
  use FrontendWeb, :controller
  import FrontendWeb.Worker

  plug(:action)

  def index(conn, _params) do
    products = [
      %{"id" => 0, "title" => "Electric Bike Canyon C32", "value" => 1.029},
      %{"id" => 1, "title" => "Muramaki - Norwegian Wood", "value" => 18}
    ]

    sendMessage("orders", products)
    sendMessage("messaging", products)

    # render page
    render(conn, "index.html")
  end
end
