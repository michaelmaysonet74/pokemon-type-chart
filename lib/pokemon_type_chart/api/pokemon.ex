defmodule PokemonTypeChart.Api.Pokemon do
  @derive Jason.Encoder
  defstruct [:name, :types]

  @type t :: %__MODULE__{
          name: String.t(),
          types: [String.t()]
        }

  def from_map(%{"name" => name, "types" => types}) do
    {:ok, %__MODULE__{name: name, types: types}}
  end

  def from_map(_), do: {:error, "Missing or invalid fields"}

  def from_pokemon(%__MODULE__{} = pokemon) do
    %{
      name: pokemon.name,
      types: pokemon.types
    }
  end
end
