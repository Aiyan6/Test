defmodule TestingEcto.Users do
  @moduledoc false
  alias TestingEcto.Repo
  alias TestingEcto.Schemas.User

 #file path -> testing_ecto/lib/users/users.ex
#add this code at the indicated place mentioned in comments of testing_ecto/lib/users/users.ex
#in the playground widget
def update(%User{} = existing_user, update_params) do
  existing_user
  |> User.update_changeset(update_params)
  |> Repo.update()
end
end
