defmodule SoggyWaffle.MixProject do
  use Mix.Project

  def project do
    [
      app: :soggy_waffle,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {SoggyWaffle.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"] 
  defp elixirc_paths(_env), do: ["lib"]
  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:jason, "~> 1.1"},
      # test only
      #file path -> soggy_waffle/mix.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/lib/soggy_waffle/weather_api.ex
#in the playground widget

      {:bypass, ">= 0.0.0", only: :test},
      {:hackney, "~> 1.16"},
      {:plug, "~> 1.7"},
      {:poison, "~> 3.1"},
      {:exvcr, "~> 0.11.0", only: [:test]}
    ]
  end
end
