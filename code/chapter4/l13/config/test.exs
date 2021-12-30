use Mix.Config

#file path -> testing_ecto/config/test.exs
#add this code at the indicated place mentioned in comments of testing_ecto/config/test.exs
#in the playground widget 
config :testing_ecto, TestingEcto.Repo,
  username: "postgres",
  password: "postgres",
  database: "testing_ecto_test",
  pool: Ecto.Adapters.SQL.Sandbox

config :logger, :console, level: :warn
