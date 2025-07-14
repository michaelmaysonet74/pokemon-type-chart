defmodule PokemonTypeChart.Router do
  alias PokemonTypeChart.Controllers.PokemonTypeController
  alias PokemonTypeChart.Controllers.PokemonTypeController

  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)
  plug(:dispatch)

  post("/pokemon/type/chart", do: PokemonTypeController.get_type_chart(conn))

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
