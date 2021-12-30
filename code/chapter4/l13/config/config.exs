use Mix.Config

config :testing_ecto,
  ecto_repos: [TestingEcto.Repo]

config :testing_ecto, TestingEcto.Repo,
  username: "postgres",
  password: "postgres",
  database: "testing_ecto_dev",
  hostname: "localhost",
  pool_size: 10,
  migration_timestamps: [type: :utc_datetime_usec]

  import_config("#{Mix.env()}.exs")
