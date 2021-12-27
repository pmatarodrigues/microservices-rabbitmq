defmodule Orderservice.Repo do
  use Ecto.Repo,
    otp_app: :orderservice,
    adapter: Ecto.Adapters.Postgres
end
