defmodule PokemonTypeChart.Api.Response do
  @derive Jason.Encoder
  defstruct [:pokemon, :type_chart]
end
