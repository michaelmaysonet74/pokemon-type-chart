defmodule PokemonTypeChart.Type do
  @valid_types [
    :bug,
    :dark,
    :dragon,
    :electric,
    :fairy,
    :fighting,
    :fire,
    :flying,
    :ghost,
    :grass,
    :ground,
    :ice,
    :normal,
    :poison,
    :psychic,
    :rock,
    :steel,
    :water
  ]

  def valid_types, do: @valid_types

  def normalize_types(types) when is_list(types) do
    if Enum.all?(types, &is_bitstring/1) do
      Enum.map(types, fn type ->
        type
        |> String.downcase()
        |> String.to_existing_atom()
      end)
    else
      []
    end
  end

  def normalize_types(_), do: []

  def clean_types(types) do
    types
    |> Enum.uniq()
    |> Enum.map(&capitalize_type/1)
  end

  defp capitalize_type(type) do
    type
    |> Atom.to_string()
    |> String.capitalize()
  end
end
