defmodule PokemonTypeChart.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {
        Plug.Cowboy,
        scheme: :http, plug: PokemonTypeChart.Router, options: [port: get_port()]
      }
    ]

    opts = [strategy: :one_for_one, name: PokemonTypeChart.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp get_port do
    System.get_env("PORT", "4000") |> String.to_integer()
  end
end
