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

   # add test for invalid arguments here
   

  end
     
end