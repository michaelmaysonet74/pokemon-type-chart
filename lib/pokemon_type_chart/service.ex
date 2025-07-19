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
      weaknesses: Enum.sort(weaknesses -- (resistances ++ immunities)),
      resistances: Enum.sort(resistances -- (weaknesses ++ immunities)),
      immunities: Enum.sort(immunities)
    }
  end

  defp get_weaknesses(charts), do: get_cleaned_types(charts, :weaknesses)

  defp get_resistances(charts), do: get_cleaned_types(charts, :resistances)

  defp get_immunities(charts), do: get_cleaned_types(charts, :immunities)

  defp get_cleaned_types(chart, field) do
    chart
    |> Enum.flat_map(fn chart -> chart[field] end)
    |> Type.clean_types()
  end
end
