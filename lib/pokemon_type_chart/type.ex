defmodule PokemonTypeChart.Type do
  @types [
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

  def valid_types?(types), do: Enum.all?(types, &valid?/1)

  def normalize_types(types) when is_list(types) do
    types
    |> Enum.filter(&valid?/1)
    |> Enum.map(&normalize_type/1)
  end

  def normalize_types(_), do: []

  def format_types(types) do
    types
    |> Enum.uniq()
    |> Enum.map(&capitalize_type/1)
  end

  defp capitalize_type(type) do
    type
    |> Atom.to_string()
    |> String.capitalize()
  end

  defp normalize_type(type) do
    type
    |> String.downcase()
    |> String.to_existing_atom()
  end

  defp valid?(type) when is_binary(type) do
    type = String.downcase(type)
    Enum.any?(@types, fn t -> Atom.to_string(t) == type end)
  end

  defp valid?(_), do: false
end
