defmodule PokemonTypeChartWeb.PokemonRequest do
  alias PokemonTypeChart.Type

  def validate(request), do: Validate.validate(request, rules())

  defp rules do
    %{
      "pokemon" => [
        required: true,
        type: :map,
        map: %{
          "name" => [required: true, type: :string],
          "types" => [
            required: true,
            type: :list,
            list: [type: :string],
            custom: &types_custom_rule/1
          ]
        }
      ]
    }
  end

  defp types_custom_rule(%{value: types}) do
    case {length(types) > 2, Type.valid_types?(types)} do
      {true, _} ->
        Validate.Validator.error("types must be a list of up to 2 valid types")

      {_, false} ->
        Validate.Validator.error("invalid types provided")

      _ ->
        Validate.Validator.success(types)
    end
  end
end
