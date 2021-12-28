defmodule TestingEcto.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Ecto.Changeset
      import TestingEcto.DataCase
      alias TestingEcto.{Factory, Repo}  
    end
  end

  setup _tags? do
    Ecto.Adapters.SQL.Sandbox.mode(TestingEcto.Repo, :manual)
  end
end
