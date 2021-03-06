defmodule FrontendWeb.PageController do
  use FrontendWeb, :controller

  def index(conn, _params) do
    # create list
    products = [
      %{"id" => 0, "title" => "Electric Bike Canyon C32", "value" => 1.029},
      %{"id" => 1, "title" => "Muramaki - Norwegian Wood", "value" => 18}
    ]

    render(conn, "index.html", products: products)
  end
end
