defmodule PokemonTypeChart.Controller do
  alias PokemonTypeChart.Api.Request
  alias PokemonTypeChart.Api.Response
  alias PokemonTypeChart.Service

  import Plug.Conn

  def get_types(conn) do
    respond(conn, Service.get_types())
  end

  def get_type_charts(conn) do
    respond(conn, %Response.TypeCharts{
      type_charts: Service.get_type_charts()
    })
  end

  def get_pokemon_type_charts(conn) do
    case Request.PokemonTypeChart.from_map(conn.body_params) do
      {:ok, req} ->
        respond(conn, %Response.PokemonTypeChart{
          pokemon: req.pokemon,
          type_chart: Service.get_type_chart(req.pokemon.types)
        })

      {:error, errors} ->
        message = get_error_message(errors)
        respond(conn, %{error: "Invalid request: #{message}"}, 400)
    end
  end

  defp respond(conn, response, status \\ 200) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, Jason.encode!(response))
  end

  defp get_error_message(errors) do
    errors
    |> Enum.map(fn
      %{path: path, message: message} when is_list(path) ->
        "#{Enum.join(path, " -> ")} #{message}"

      %{message: message} ->
        message
    end)
    |> Enum.join(", ")
  end
end
