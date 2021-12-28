defmodule TestingEcto.UsersTest do
  use TestingEcto.DataCase
  alias TestingEcto.Users
  alias TestingEcto.Schemas.User


  #file path -> testing_ecto/test/users/users_test.exs
#add this code at the indicated place mentioned in comments of testing_ecto/test/users/users_test.exs
#in the playground widget
  
  
  setup do
    Ecto.Adapters.SQL.Sandbox.checkout(TestingEcto.Repo) 
  end

  describe "create/1" do
    test "success: it inserts a user in the db and returns the user" do
      params = Factory.string_params_for(:user)  
      now = DateTime.utc_now()  

      assert {:ok, %User{} = returned_user} = Users.create(params)  

      user_from_db = Repo.get(User, returned_user.id)  
      assert returned_user == user_from_db  

      mutated = ["date_of_birth"]

      for {param_field, expected} <- params,
          param_field not in mutated do
        schema_field = String.to_existing_atom(param_field)
        actual = Map.get(user_from_db, schema_field)

        assert actual == expected,
               "Values did not match for field: #{param_field}\nexpected: #{
                 inspect(expected)
               }\nactual: #{inspect(actual)}"
      end

      expected_dob = Date.from_iso8601!(params["date_of_birth"])
      assert user_from_db.date_of_birth == expected_dob

      assert user_from_db.inserted_at == user_from_db.updated_at
      assert DateTime.compare(now, user_from_db.inserted_at) == :lt  
    end
  end


  #file path -> testing_ecto/test/users/users_test.exs
#add this code at the indicated place mentioned in comments of testing_ecto/test/users/users_test.exs
#in the playground widget
test "error: returns an error tuple when user can't be created" do
  missing_params = %{}

  assert {:error, %Changeset{valid?: false}} =
            Users.create(missing_params)
end
  


end

