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
test "auth error: returns 401 when valid jwt isn't in headers", %{
      conn: conn,  
      user: existing_user
    } do
      conn =
        put(conn, "/api/users/#{existing_user.id}", %{ 
          name: "#{existing_user.name}-updated"
        })

      assert body = json_response(conn, 401) 

      assert %{ 
               "errors" => [
                 %{"message" => "Invalid token.", "field" => "token"}
               ]
             } == body

      user_from_db = Repo.get(User, existing_user.id)  

      assert_values_for(
        expected: existing_user,
        actual: user_from_db,
        fields: fields_for(User)
        )
    end
    #file path -> not_skull/test/not_skull_web/controllers/json_api/user_controller_test.exs
#add this code at the indicated place mentioned in comments of not_skull/test/not_skull_web/controllers/json_api/user_controller_test.exs
#in the playground widget
test "auth error: returns 403 when path and jwt user ids don't match",
         %{
           conn_with_token: conn_with_token,
           user: existing_user
         } do
          conn =
            put(conn_with_token, "/api/users/#{Factory.uuid()}", %{
              name: "#{existing_user.name}-updated"
            })

      assert body = json_response(conn, 403)

      assert %{
               "errors" => [
                 %{
                   "message" => "You are not authorized for that action.",
                   "field" => "token"
                 }
               ]
             } == body

      user_from_db = Repo.get(User, existing_user.id)

      assert_values_for(
        expected: existing_user,
        actual: user_from_db,
        fields: fields_for(User)
        )
    end
    
       

  end
     
end