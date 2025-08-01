defmodule PokemonTypeChart.Endpoint do
  use Plug.Builder

  plug(Plug.RequestId)
  plug(Plug.Logger)

  plug(
    Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(PokemonTypeChart.Router)
end
