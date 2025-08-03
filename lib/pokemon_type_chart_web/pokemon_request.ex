defmodule PokemonTypeChart.PokemonRequest do
  alias PokemonTypeChart.Type

  def rules do
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
            custom: fn %{value: types} ->
              case {length(types) > 2, Type.valid_types?(types)} do
                {true, _} ->
                  Validate.Validator.error("types must be a list of up to 2 valid types")

                {_, false} ->
                  Validate.Validator.error("invalid types provided")

                _ ->
                  Validate.Validator.success(types)
              end
            end
          ]
        }
      ]
    }
  end

  def validate(request), do: Validate.validate(request, rules())
end
