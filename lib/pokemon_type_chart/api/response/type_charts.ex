defmodule PokemonTypeChart.Api.Response.TypeCharts do
  @derive Jason.Encoder
  defstruct type_charts: %{
              type: "",
              immunities: [],
              resistances: [],
              weaknesses: []
            }
end
