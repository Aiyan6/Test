defmodule TestingEcto.MixProject do
  use Mix.Project

  def project do
    [
      app: :testing_ecto,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TestingEcto.Application, []}
    ]
  end
  
  defp elixirc_paths(:test), do: ["lib", "test"] 
  defp elixirc_paths(_), do: ["lib"]
  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
        {:ecto, "~> 3.0"},
        {:ecto_sql, "~> 3.4"},
        {:postgrex, "~> 0.15.0"},
        {:faker, "~> 0.13.0", only: [:test, :dev]}

        #perform updates here 
     
    ]
  end
end
