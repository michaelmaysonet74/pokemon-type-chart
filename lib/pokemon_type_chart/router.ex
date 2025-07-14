defmodule PokemonTypeChart.Router do
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)
  plug(:dispatch)

  post("/pokemon/type/chart", do: PokemonTypeChart.Controller.get_type_chart(conn))

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
