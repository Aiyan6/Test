defmodule TestingEcto.UsersTest do
  use TestingEcto.DataCase
  alias TestingEcto.Users
  alias TestingEcto.Schemas.User

  setup do
    Ecto.Adapters.SQL.Sandbox.checkout(TestingEcto.Repo) 
  end


  describe "delete/1" do
   #file path -> testing_ecto/test/users/users_test.exs
#add this code at the indicated place mentioned in comments of testing_ecto/test/users/users_test.exs
#in the playground widget

  test "success: it deletes the user" do
    user = Factory.insert(:user)

    assert {:ok, _deleted_user} = Users.delete(user)

    refute Repo.get(User, user.id)
  end
  end

end

