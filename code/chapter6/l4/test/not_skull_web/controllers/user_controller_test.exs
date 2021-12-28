defmodule NotSkullWeb.UserControllerTest do
  use NotSkullWeb.ConnCase, async: false

  alias NotSkull.Accounts.User

  describe "PUT /api/users/:id" do
    setup context do
      {:ok, user} = Factory.insert(:user)

      conn_with_token = 
        put_req_header(  
          context.conn,
          "authorization",
          "Bearer " <> sign_jwt(user.id)  
        )

      Map.merge(context, %{user: user, conn_with_token: conn_with_token})
    end

   #file path -> test/not_skull_web/controllers/user_controller_test.exs
#add this code at the indicated place mentioned in comments of test/not_skull_web/controllers/user_controller_test.exs
#in the playground widget
test "error: does not update, returns errors when given invalid attributes",
      %{
        conn_with_token: conn_with_token,  
        user: existing_user
      } do
  conn =
    put(conn_with_token, "/api/users/#{existing_user.id}", %{name: ""})  

  assert body = json_response(conn, 422) 

  user_from_db = Repo.get(User, existing_user.id)
  assert user_from_db == existing_user  

  actual_errors = body["errors"]
  refute Enum.empty?(actual_errors)

  expected_error_keys = ["field", "message"]

  for error <- actual_errors do  
    assert_unordered_lists_are_equal(
      actual: Map.keys(error),
      expected: expected_error_keys
    )
  end
end
   

  end
     
end