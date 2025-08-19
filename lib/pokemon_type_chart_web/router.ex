defmodule PokemonTypeChartWeb.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  post "/pokemon/effectiveness" do
    PokemonTypeChartWeb.Controller.get_pokemon_type_charts(conn)
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
