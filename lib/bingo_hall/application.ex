defmodule BingoHall.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(BingoHallWeb.Endpoint, []),

      supervisor(BingoHallWeb.Presence, [])
    ]

    opts = [strategy: :one_for_one, name: BingoHall.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    BingoHallWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
