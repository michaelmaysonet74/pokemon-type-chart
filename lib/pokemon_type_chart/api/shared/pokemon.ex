defmodule PokemonTypeChart.Api.Shared.Pokemon do
  @derive Jason.Encoder
  defstruct [:name, :types]

  @validation %{
    "name" => [required: true, type: :string],
    "types" => [
      required: true,
      type: :list,
      list: [type: :string]
    ]
  }

  def validation, do: @validation

  def from_map(%{"name" => name, "types" => types} = pokemon) do
    with {:ok, _} <- Validate.validate(pokemon, @validation) do
      {:ok, %__MODULE__{name: name, types: types}}
    end
  end

  def from_map(_), do: {:error, "Missing or invalid fields"}
end
