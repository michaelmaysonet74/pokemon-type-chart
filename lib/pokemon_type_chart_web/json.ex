defmodule PokemonTypeChart.JSON do
  import Plug.Conn

  def send(conn, response, status \\ 200) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, Jason.encode!(response))
  end
end
