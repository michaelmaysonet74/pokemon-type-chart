defmodule PokemonTypeChart.Api.Response.PokemonTypeChart do
  alias PokemonTypeChart.Api.Shared.Pokemon

  @derive Jason.Encoder
  defstruct pokemon: %Pokemon{},
            type_chart: %{immunities: [], resistances: [], weaknesses: []}
end
