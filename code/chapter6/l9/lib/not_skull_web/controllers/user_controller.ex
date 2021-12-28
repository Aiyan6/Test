# START:file_new_and_create
defmodule NotSkullWeb.UserController do
  use NotSkullWeb, :controller

  alias NotSkull.Accounts
  alias NotSkull.Accounts.User
  alias NotSkull.ExternalServices.Email

  def new(conn, _params) do
    user = User.create_changeset(%{})
    render(conn, "new.html", changeset: user)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        Email.send_welcome(user)

        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Your account was created successfully!")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end

