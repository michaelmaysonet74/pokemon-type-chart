defmodule PokemonTypeChart.Controller do
  import PokemonTypeChart.Error
  import PokemonTypeChart.Json

  alias PokemonTypeChart.Schema.{
    PokemonTypeChartRequest,
    PokemonTypeChartResponse,
    TypeChartsResponse
  }

  alias PokemonTypeChart.Service

  def get_types(conn) do
    respond(conn, Service.get_types())
  end

  def get_type_charts(conn) do
    respond(conn, %TypeChartsResponse{
      type_charts: Service.get_type_charts()
    })
  end

  def get_pokemon_type_charts(conn) do
    case PokemonTypeChartRequest.from_map(conn.body_params) do
      {:ok, req} ->
        respond(conn, %PokemonTypeChartResponse{
          pokemon: req.pokemon,
          type_chart: Service.get_type_chart(req.pokemon.types)
        })

      {:error, errors} ->
        message = get_error_message(errors)
        respond(conn, %{error: "Invalid request: #{message}"}, 400)
    end
  end
end
