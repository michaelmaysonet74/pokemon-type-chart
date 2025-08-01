defmodule PokemonTypeChart.Schema.PokemonTypeChartRequest do
  alias PokemonTypeChart.Schema.Pokemon

  @derive Jason.Encoder
  defstruct pokemon: %Pokemon{}

  @validation %{
    "pokemon" => [
      required: true,
      type: :map,
      map: Pokemon.validation()
    ]
  }

  def from_map(%{"pokemon" => pokemon} = request) do
    with {:ok, _} <- Validate.validate(request, @validation),
         {:ok, res} <- Pokemon.from_map(pokemon) do
      {:ok, %__MODULE__{pokemon: res}}
    end
  end

  def from_map(_), do: {:error, [%{message: "Missing or invalid fields"}]}
end
