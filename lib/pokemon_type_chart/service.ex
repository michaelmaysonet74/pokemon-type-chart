defmodule PokemonTypeChart.Service do
  alias PokemonTypeChart.Chart
  alias PokemonTypeChart.Type

  def get_type_chart(types) when is_list(types) and length(types) <= 2 do
    types
    |> Type.normalize_types()
    |> Enum.map(&Chart.get_chart_by_type/1)
    |> merge()
  end

  def get_type_chart(_), do: Chart.empty()

  defp merge(charts) do
    weaknesses = get_weaknesses(charts)
    resistances = get_resistances(charts)
    immunities = get_immunities(charts)

    %{
      weaknesses: weaknesses -- (resistances ++ immunities),
      resistances: resistances -- (weaknesses ++ immunities),
      immunities: immunities
    }
  end

  defp get_weaknesses(charts) do
    charts
    |> Enum.flat_map(fn chart -> chart.weaknesses end)
    |> Type.clean_types()
  end

  defp get_resistances(charts) do
    charts
    |> Enum.flat_map(fn chart -> chart.resistances end)
    |> Type.clean_types()
  end

  defp get_immunities(charts) do
    charts
    |> Enum.flat_map(fn chart -> chart.immunities end)
    |> Type.clean_types()
  end
end
