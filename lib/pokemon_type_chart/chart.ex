defmodule PokemonTypeChart.Chart do
  @type_chart %{
    bug: %{
      weaknesses: [:fire, :flying, :rock],
      resistances: [:fighting, :grass, :ground],
      immunities: []
    },
    dark: %{
      weaknesses: [:bug, :fairy, :fighting],
      resistances: [:dark, :ghost],
      immunities: [:psychic]
    },
    dragon: %{
      weaknesses: [:dragon, :fairy, :ice],
      resistances: [:electric, :fire, :grass, :water],
      immunities: []
    },
    electric: %{
      weaknesses: [:ground],
      resistances: [:electric, :flying, :steel],
      immunities: []
    },
    fairy: %{
      weaknesses: [:poison, :steel],
      resistances: [:bug, :dark, :fighting],
      immunities: [:dragon]
    },
    fighting: %{
      weaknesses: [:fairy, :flying, :psychic],
      resistances: [:bug, :dark, :rock],
      immunities: []
    },
    fire: %{
      weaknesses: [:ground, :rock, :water],
      resistances: [:bug, :fairy, :fire, :grass, :ice, :steel],
      immunities: []
    },
    flying: %{
      weaknesses: [:electric, :ice, :rock],
      resistances: [:bug, :fighting, :grass],
      immunities: [:ground]
    },
    ghost: %{
      weaknesses: [:dark, :ghost],
      resistances: [:bug, :poison],
      immunities: [:fighting, :normal]
    },
    grass: %{
      weaknesses: [:bug, :fire, :flying, :ice, :poison],
      resistances: [:electric, :grass, :ground, :water],
      immunities: []
    },
    ground: %{
      weaknesses: [:grass, :ice, :water],
      resistances: [:poison, :rock],
      immunities: [:electric]
    },
    ice: %{
      weaknesses: [:fighting, :fire, :rock, :steel],
      resistances: [:ice],
      immunities: []
    },
    normal: %{
      weaknesses: [:fighting],
      resistances: [],
      immunities: [:ghost]
    },
    poison: %{
      weaknesses: [:ground, :psychic],
      resistances: [:bug, :fairy, :fighting, :grass, :poison],
      immunities: []
    },
    psychic: %{
      weaknesses: [:bug, :dark, :ghost],
      resistances: [:fighting, :psychic],
      immunities: []
    },
    rock: %{
      weaknesses: [:fighting, :grass, :ground, :steel, :water],
      resistances: [:fire, :flying, :normal, :poison],
      immunities: []
    },
    steel: %{
      weaknesses: [:fighting, :fire, :ground],
      resistances: [
        :bug,
        :dragon,
        :fairy,
        :flying,
        :grass,
        :ice,
        :normal,
        :psychic,
        :rock,
        :steel
      ],
      immunities: [:poison]
    },
    water: %{
      weaknesses: [:electric, :grass],
      resistances: [:fire, :ice, :steel, :water],
      immunities: []
    }
  }

  def empty do
    %{
      weaknesses: [],
      resistances: [],
      immunities: []
    }
  end

  def get_chart_by_type(type) when is_atom(type) do
    @type_chart
    |> Map.get(type, empty())
  end

  def get_chart_by_type(_), do: empty()
end
