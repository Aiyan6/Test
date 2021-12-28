use Mix.Config

config :testing_ecto, TestingEcto.Repo,
  database: "testing_ecto_test",
  pool: Ecto.Adapters.SQL.Sandbox

config :logger, :console, level: :warn
