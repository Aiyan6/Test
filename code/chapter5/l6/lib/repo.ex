defmodule TestingEcto.Repo do
  @moduledoc false

  use Ecto.Repo,
    otp_app: :testing_ecto,
    adapter: Ecto.Adapters.Postgres
end
