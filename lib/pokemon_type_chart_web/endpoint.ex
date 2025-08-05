defmodule PokemonTypeChartWeb.Endpoint do
  use Plug.Builder

  plug(Plug.RequestId)
  plug(Plug.Logger)

  plug(
    Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: JSON
  )

  plug(PokemonTypeChartWeb.Router)
end
