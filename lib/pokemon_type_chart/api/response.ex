defmodule PokemonTypeChart.Api.Response do
  alias PokemonTypeChart.Api.Pokemon

  @derive Jason.Encoder
  defstruct [:pokemon, :type_chart]

  @type t :: %__MODULE__{
          pokemon: Pokemon.t(),
          type_chart: %{
            weaknesses: [String.t()],
            resistences: [String.t()],
            immunities: [String.t()]
          }
        }
end
