defmodule PokemonTypeChart.Controller do
  alias PokemonTypeChart.Api.Request
  alias PokemonTypeChart.Api.Response
  alias PokemonTypeChart.Service

  import Plug.Conn

  def get_type_chart(conn) do
    case Request.from_map(conn.body_params) do
      {:ok, req} ->
        respond(conn, 200, %Response{
          pokemon: req.pokemon,
          type_chart: Service.get_type_chart(req.pokemon.types)
        })

      {:error, errors} ->
        message = get_error_message(errors)
        respond(conn, 400, %{error: "Invalid request: #{message}"})
    end
  end

  defp respond(conn, status, response) do
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
