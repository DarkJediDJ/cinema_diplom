defmodule CinemaApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CinemaApiWeb.Telemetry,
      # Start the Ecto repository
      CinemaApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CinemaApi.PubSub},
      # Start Finch
      {Finch, name: CinemaApi.Finch},
      # Start the Endpoint (http/https)
      CinemaApiWeb.Endpoint
      # Start a worker by calling: CinemaApi.Worker.start_link(arg)
      # {CinemaApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CinemaApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CinemaApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
