#file path -> test/not_skull_web/channels/user_socket_test.exs
#add this code at the indicated place mentioned in comments of test/not_skull_web/channels/user_socket_test.exs
#in the playground widget
defmodule NotSkullWeb.UserSocketTest do
  use NotSkullWeb.ChannelCase 
  alias NotSkullWeb.UserSocket

  describe "connect/3" do

  #file path -> test/not_skull_web/channels/user_socket_test.exs
#add this code at the indicated place mentioned in comments of test/not_skull_web/channels/user_socket_test.exs
#in the playground widget
test "success: allows connection when passed a valid JWT for a real user" do
      {:ok, existing_user} = Factory.insert(:user)
      jwt = sign_jwt(existing_user.id)

      assert {:ok, socket} = connect(UserSocket, %{token: jwt}) 
      assert socket.assigns.user_id == existing_user.id 
      assert socket.id == "user_socket:#{existing_user.id}" 
end

#file path -> test/not_skull_web/channels/user_socket_test.exs
#add this code at the indicated place mentioned in comments of test/not_skull_web/channels/user_socket_test.exs
#in the playground widget
test "error: returns :error for an invalid JWT" do
      assert :error = connect(UserSocket, %{token: "bad_token"})
end

#file path -> test/not_skull_web/channels/user_socket_test.exs
#add this code at the indicated place mentioned in comments of test/not_skull_web/channels/user_socket_test.exs
#in the playground widget
@tag capture_log: true
    test "error: returns :error if user doesn't exist" do
      jwt = sign_jwt(Factory.uuid())

      assert :error = connect(UserSocket, %{token: jwt})
end

  end
end