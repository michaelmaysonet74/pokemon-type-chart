defmodule PokemonTypeChart.Schema.TypeChartsResponse do
  @derive Jason.Encoder
  defstruct type_charts: %{
              type: "",
              immunities: [],
              resistances: [],
              weaknesses: []
            }
end
