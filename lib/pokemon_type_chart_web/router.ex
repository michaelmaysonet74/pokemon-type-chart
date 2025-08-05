defmodule PokemonTypeChartWeb.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  post "/pokemon/type-charts" do
    PokemonTypeChartWeb.Controller.get_pokemon_type_charts(conn)
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
