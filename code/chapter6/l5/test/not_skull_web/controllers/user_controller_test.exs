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
test "success: updates db returns record with good params", %{
      conn_with_token: conn_with_token,
      user: existing_user
    } do
      new_name = "#{existing_user.name}-updated"

      conn =
        put(conn_with_token, "/api/users/#{existing_user.id}", %{
          name: new_name
        })

      assert parsed_return = json_response(conn, 200)

      user_from_db = Repo.get(User, existing_user.id)

      assert_values_for( 
        expected: %{existing_user | name: new_name},
        actual: user_from_db,
        fields: fields_for(User) -- [:updated_at] 
      )

      assert DateTime.to_unix(user_from_db.updated_at, :microsecond) > 
               DateTime.to_unix(existing_user.updated_at, :microsecond)

      # checking that the updated record is what is returned from endpoint
      assert_values_for(  
        expected: user_from_db,
        actual: {parsed_return, :string_keys},
        fields: fields_for(User),
        opts: [convert_dates: true]
      )
end
   

  end
     
end