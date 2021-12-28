defmodule TestingEcto.UsersTest do
  use TestingEcto.DataCase
  alias TestingEcto.Users
  alias TestingEcto.Schemas.User

  setup do
    Ecto.Adapters.SQL.Sandbox.checkout(TestingEcto.Repo) 
  end

   #file path -> testing_ecto/test/users/users_test.exs
#add this code at the indicated place mentioned in comments of testing_ecto/test/users/users_test.exs
#in the playground widget
describe "get/1" do
  test "success: it returns a user when given a valid UUID" do
    existing_user = Factory.insert(:user) 

    assert {:ok, returned_user} = Users.get(existing_user.id)

    assert returned_user == existing_user
  end

  test "error: it returns an error tuple when a user doesn't exist" do
    assert {:error, :not_found} = Users.get(Ecto.UUID.generate())
  end
end
  

end

