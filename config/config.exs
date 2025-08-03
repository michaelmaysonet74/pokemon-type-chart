import Config

config :pokemon_type_chart,
  port: System.get_env("PORT", "4001") |> String.to_integer()
