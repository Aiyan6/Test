#---
# Excerpted from "Testing Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/lmelixir for more book information.
#---
defmodule NotSkull.Accounts do
  @moduledoc false
  alias NotSkull.Repo
  alias NotSkull.Accounts.User
  alias NotSkull.ExternalServices.Email

import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  def create_user(params, emailer \\ Email) do
    result =
      params
      |> User.create_changeset()
      |> Repo.insert()

    case result do
      {:ok, new_user} ->
        emailer.send_welcome(new_user)
        {:ok, new_user}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def get_user_by_id(user_id) do
    if user = Repo.get(User, user_id) do
      {:ok, user}
    else
      {:error, :not_found}
    end
  end

  def update_user(%User{} = existing_user, update_params) do
    existing_user
    |> User.update_changeset(update_params)
    |> Repo.update()
  end

  def get_user_by_credentials(email, password) do
  # try to get user by unique email from DB
  user = Repo.get_by(User, email: email)
    result = cond do
      # if user was found and provided password hash equals to stored
      # hash
      user && user.password -> #checkpw(password, user.password_hash) ->
        {:ok, user}
      # else if we just found the use
      user ->
        {:error, :not_found}
      # otherwise
      true ->
        # simulate check password hash timing
        dummy_checkpw
        {:error, :not_found}
    end
  end

end