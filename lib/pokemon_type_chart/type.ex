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
    if Enum.all?(types, fn t -> is_bitstring(t) end) do
      types
      |> Enum.map(&String.downcase/1)
      |> Enum.map(&String.to_existing_atom/1)
    else
      []
    end
  end

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
