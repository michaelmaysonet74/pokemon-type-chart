defmodule PokemonTypeChart.Schema.PokemonTypeChartResponse do
  alias PokemonTypeChart.Schema.Pokemon

  @derive Jason.Encoder
  defstruct pokemon: %Pokemon{},
            type_chart: %{immunities: [], resistances: [], weaknesses: []}
end
