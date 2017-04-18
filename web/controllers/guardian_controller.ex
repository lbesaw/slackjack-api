defmodule Discuss.GuardianController do
  use Discuss.Web, :controller
  alias Discuss.User

  plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__

def gsignin(conn, _params) do
  user = Guardian.Plug.current_resource(conn)
  redirect(conn, to: topic_path(conn, :index))
end

def unauthenticated(conn, _params) do
  conn
  |> put_status(401)
  |> put_flash(:error, "Authentication required")
  |> redirect(to: topic_path(conn, :index))

end
  # case insert_or_update_user(changeset) do
  #   {:ok, user} ->
  #     conn
  #     |> put_flash(:info, "GUARDIAN SIGN IN, #{user.email}")
  #     |> put_session(:user_id, user.id)
  #     |> redirect(to: topic_path(conn, :index))
  #   {:error, _reason} ->
  #     conn
  #     |> put_flash(:error, "GUARDIAN error sign in")
  #     |> redirect(to: topic_path(conn, :index))
  # end

  end
