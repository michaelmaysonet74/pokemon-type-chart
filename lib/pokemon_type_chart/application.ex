defmodule PokemonTypeChart.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {
        Bandit,
        plug: PokemonTypeChart.Endpoint, port: Application.get_env(:pokemon_type_chart, :port)
      }
    ]

    opts = [strategy: :one_for_one, name: PokemonTypeChart.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
