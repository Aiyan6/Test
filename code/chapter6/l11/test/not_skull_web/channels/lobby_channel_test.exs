#file path -> test/not_skull_web/channels/lobby_channel_test.exs
#add this code at the indicated place mentioned in comments of test/not_skull_web/channels/lobby_channel_test.exs
#in the playground widget
defmodule NotSkullWeb.LobbyChannelTest do
  use NotSkullWeb.ChannelCase
  alias NotSkullWeb.{LobbyChannel, UserSocket}

  describe "broadcast_new_game/1" do
    setup do
      user_id = Factory.uuid() 

      {:ok, _, socket} =
        UserSocket
        |> socket("user_socket:#{user_id}", %{user_id: user_id}) 
        |> subscribe_and_join(LobbyChannel, "lobby:lobby") 

      %{socket: socket}
    end

      #file path -> test/not_skull_web/channels/lobby_channel_test.exs
#add this code at the indicated place mentioned in comments of test/not_skull_web/channels/lobby_channel_test.exs
#in the playground widget
test "success: returns :ok, sends broadcast when passed an open game" do  
      open_game = Factory.struct_for(:game, %{current_phase: :joining}) 

      assert :ok = LobbyChannel.broadcast_new_game(open_game) 

      assert_broadcast("new_game_created", broadcast_payload) 
      assert broadcast_payload == %{game_id: open_game.id} 

      assert Jason.encode!(broadcast_payload) 
 end
  end





end