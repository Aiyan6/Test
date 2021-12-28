defmodule TestingEcto.UsersTest do
  use TestingEcto.DataCase
  alias TestingEcto.Users
  alias TestingEcto.Schemas.User

  setup do
    Ecto.Adapters.SQL.Sandbox.checkout(TestingEcto.Repo) 
  end

  describe "update/2" do

    #file path -> testing_ecto/test/users/users_test.exs
#add this code at the indicated place mentioned in comments of testing_ecto/test/users/users_test.exs
#in the playground widget

  test "success: it updates database and returns the user" do
    existing_user = Factory.insert(:user) 

    params =  
      Factory.string_params_for(:user)
      |> Map.take(["first_name"])

    assert {:ok, returned_user} = Users.update(existing_user, params)

    user_from_db = Repo.get(User, returned_user.id)
    assert returned_user == user_from_db

    expected_user_data =  
      existing_user
      |> Map.from_struct()
      |> Map.drop([:__meta__, :updated_at])  
      |> Map.put(:first_name, params["first_name"])

    for {field, expected} <- expected_user_data do
      actual = Map.get(user_from_db, field)

      assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{
                inspect(expected)
              }\nactual: #{inspect(actual)}"
    end

    refute user_from_db.updated_at == existing_user.updated_at  
    assert %DateTime{} = user_from_db.updated_at
  end

    #file path -> testing_ecto/test/users/users_test.exs
#add this code at the indicated place mentioned in comments of testing_ecto/test/users/users_test.exs
#in the playground widget
test "error: returns an error tuple when user can't be updated" do
  existing_user = Factory.insert(:user)
  bad_params = %{"first_name" => DateTime.utc_now()}  

  assert {:error, %Changeset{}} = Users.update(existing_user, bad_params)

  assert existing_user == Repo.get(User, existing_user.id) 
end
  
  end


end

