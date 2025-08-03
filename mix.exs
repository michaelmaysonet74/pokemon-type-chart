defmodule PokemonTypeChart.MixProject do
  use Mix.Project

  def project do
    [
      app: :pokemon_type_chart,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps() ++ dev_deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PokemonTypeChart.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bandit, "~> 1.7"},
      {:validate, "~> 1.3"}
    ]
  end

  defp dev_deps do
    [
      {:exsync, "~> 0.4", only: :dev}
    ]
  end
end
