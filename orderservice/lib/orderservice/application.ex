defmodule Orderservice.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Orderservice.Repo,
      # Start the Telemetry supervisor
      OrderserviceWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Orderservice.PubSub},
      # Start the Endpoint (http/https)
      OrderserviceWeb.Endpoint
      # Start a worker by calling: Orderservice.Worker.start_link(arg)
      # {Orderservice.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Orderservice.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OrderserviceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
