defmodule PokemonTypeChart.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  post "/pokemon/type-charts" do
    PokemonTypeChart.Controller.get_pokemon_type_charts(conn)
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
