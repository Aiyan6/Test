defmodule NotSkullWeb.LobbyChannel do
  use NotSkullWeb, :channel

  #file path -> lib/not_skull_web/channels/lobby_channel.ex
#add this code at the indicated place mentioned in comments of lib/not_skull_web/channels/lobby_channel.ex
#in the playground widget
alias NotSkull.GameEngine.Game

@impl true
  def join("lobby:lobby", _payload, socket) do 
    {:ok, socket}
  end

  @spec broadcast_new_game(Game.t()) :: :ok | :error
  def broadcast_new_game(%Game{current_phase: :joining} = game) do
    NotSkullWeb.Endpoint.broadcast!("lobby:lobby", "new_game_created", %{ 
      game_id: game.id
    })
  end

  def broadcast_new_game(_) do
    :error
  end
  
end
