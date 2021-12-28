defmodule NotSkullWeb.UserControllerTest do
  use NotSkullWeb.ConnCase, async: false

  alias NotSkull.Accounts.User

 
describe "POST /users" do
    #file path -> test/not_skull_web/controllers/user_controller_test.exs
#add this code at the indicated place mentioned in comments of test/not_skull_web/controllers/user_controller_test.exs
#in the playground widget
test "error: does not insert, redirects to 'new' page w/invalid attributes",
         %{
           conn: conn
         } do
      flunk_if_email_is_sent()  

      expected_user_count = Repo.all(User) |> Enum.count() 
      conn = post(conn, Routes.user_path(conn, :create), user: %{})

      assert html = html_response(conn, 200)

      parsed_html = Floki.parse_document!(html)
      for field <- ["name", "email", "password"] do 
        # using <> so that the first #(indicating an id) is easy to read
        field_as_id = "#" <> "#{field}-error"
        span = Floki.find(parsed_html, field_as_id)
        assert Floki.text(span) == "can't be blank" 
      end

      assert Repo.all(User) |> Enum.count() == expected_user_count, 
             "There should have been no records inserted during this test."
end
end
     
end