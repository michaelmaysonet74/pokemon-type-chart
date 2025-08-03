defmodule PokemonTypeChart.Controller do
  alias PokemonTypeChart.JSON
  alias PokemonTypeChart.Service
  alias PokemonTypeChart.PokemonRequest

  def get_pokemon_type_charts(conn) do
    case PokemonRequest.validate(conn.body_params) do
      {:ok, %{"pokemon" => pokemon}} ->
        conn
        |> JSON.send(%{
          pokemon: pokemon,
          type_chart: Service.get_type_chart(Map.get(pokemon, "types"))
        })

      {:error, errors} ->
        conn |> JSON.send(Validate.Util.errors_to_map(errors), 400)
    end
  end
end
