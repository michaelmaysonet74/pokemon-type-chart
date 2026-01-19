defmodule PokemonTypeChart.Chart do
  @type_chart "resources/type_chart.json"
              |> File.read!()
              |> JSON.decode!()

  def empty do
    %{
      weaknesses: [],
      resistances: [],
      immunities: []
    }
  end

  def get_chart_by_type(type) when is_binary(type) do
    @type_chart
    |> Map.get(type, empty())
  end

  def get_chart_by_type(_), do: empty()
end
