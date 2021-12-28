defmodule TestingEcto.MixProject do
  use Mix.Project

  def project do
    [
      app: :testing_ecto,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      #file path -> testing_ecto/mix.exs
#add this code at the indicated place mentioned in comments of testing_ecto/mix.exs
#in the playground widget  
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
  
 #file path -> testing_ecto/mix.exs
#add this code at the indicated place mentioned in comments of testing_ecto/mix.exs
#in the playground widget  
    defp elixirc_paths(:test), do: ["lib", "test"] 
    defp elixirc_paths(_), do: ["lib"]


  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
        {:ecto, "~> 3.0"},
        {:faker, "~> 0.13.0", only: [:test, :dev]}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
