defmodule PokemonTypeChart.Controller do
  alias PokemonTypeChart.Api.Request
  alias PokemonTypeChart.Api.Response
  alias PokemonTypeChart.Api.Pokemon
  alias PokemonTypeChart.Service

  import Plug.Conn

  def get_type_chart(conn) do
    case Request.from_map(conn.body_params) do
      {:ok, req} ->
        respond(conn, 200, %Response{
          pokemon: Pokemon.from_pokemon(req.pokemon),
          type_chart: Service.get_type_chart(req.pokemon.types)
        })

      {:error, _} ->
        respond(conn, 400, %{error: "Invalid request"})
    end
  end

  defp respond(conn, status, response) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, Jason.encode!(response))
  end
end
