defmodule PokemonTypeChartWeb.Controller do
  alias PokemonTypeChartWeb.JSON
  alias PokemonTypeChartWeb.PokemonRequest
  alias PokemonTypeChart.Effectiveness

  def get_pokemon_effectiveness(conn) do
    case PokemonRequest.validate(conn.body_params) do
      {:ok, %{"pokemon" => pokemon}} ->
        conn
        |> JSON.send(%{
          pokemon: pokemon,
          effectiveness: Effectiveness.calculate(pokemon)
        })

      {:error, errors} ->
        conn
        |> JSON.send(
          %{errors: Validate.Util.errors_to_map(errors)},
          400
        )
    end
  end
end
