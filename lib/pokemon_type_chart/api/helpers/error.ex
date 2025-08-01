defmodule PokemonTypeChart.Error do
  def get_error_message(errors) when is_list(errors) do
    errors
    |> Enum.map(&format_error/1)
    |> Enum.join(", ")
  end

  def get_error_message(error), do: format_error(error)

  defp format_error(%{path: path, message: message}) when is_list(path) do
    "#{Enum.join(path, " -> ")}: #{message}"
  end

  defp format_error(%{message: message}), do: message

  defp format_error(_), do: "An unknown error occurred"
end
