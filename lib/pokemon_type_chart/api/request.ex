defmodule PokemonTypeChart.Api.Request do
  alias PokemonTypeChart.Api.Pokemon

  @derive Jason.Encoder
  defstruct [:pokemon]

  @type t :: %__MODULE__{
          pokemon: Pokemon.t()
        }

  def from_map(%{"pokemon" => pokemon}) do
    case Pokemon.from_map(pokemon) do
      {:ok, res} -> {:ok, %__MODULE__{pokemon: res}}
      {:error, _} -> {:error, "Missing or invalid fields in pokemon"}
    end
  end

  def from_map(_), do: {:error, "Missing or invalid fields"}
end
