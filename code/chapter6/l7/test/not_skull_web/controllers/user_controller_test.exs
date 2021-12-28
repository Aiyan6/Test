
#file path -> test/not_skull_web/controllers/user_controller_test.exs
#add this code at the indicated place mentioned in comments of test/not_skull_web/controllers/user_controller_test.exs
#in the playground widget
defmodule NotSkullWeb.UserControllerTest do
  use NotSkullWeb.ConnCase, async: false
  alias NotSkull.Accounts.User

  #file path -> test/not_skull_web/controllers/user_controller_test.exs
#add this code at the indicated place mentioned in comments of test/not_skull_web/controllers/user_controller_test.exs
#in the playground widget
    describe "GET /users/new" do 
        test "success: it renders the form", %{conn: conn} do  
        conn = get(conn, Routes.user_path(conn, :new)) 

        assert response = html_response(conn, 200)  
        assert response =~ "Create a new account"  
        end
    end
end