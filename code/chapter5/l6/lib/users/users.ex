defmodule TestingEcto.Users do
  @moduledoc false
  alias TestingEcto.Repo
  alias TestingEcto.Schemas.User

  #file path -> testing_ecto/lib/users/users.ex
#add this code at the indicated place mentioned in comments of testing_ecto/lib/users/users.ex
#in the playground widget
def delete(%User{} = user) do
  Repo.delete(user)
end


end
