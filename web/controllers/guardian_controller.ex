defmodule Discuss.GuardianController do
  use Discuss.Web, :controller
  alias Discuss.User

  plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__

def gsignin(conn, params) do
  # case Discuss.AuthController.insert_or_update_user(params) do
  #   {:ok, user} ->
  #     new_conn = Guardian.Plug.api_sign_in(conn, user)
  #     jwt = Guardian.Plug.current_token(new_conn)
  #     claims = Guardian.Plug.claims(new_conn)
  #     exp = Map.get(claims, "exp")
  #
  #     new_conn
  #     |> put_resp_header("authorization", "Bearer #{jwt}")
  #     |> put_resp_header("x-expires", exp)
  #     |> render "login.json", user: user, jwt: jwt, exp: exp
  #
  #   {:error, changeset} ->
  #     conn
  #     |> put_status(401)
  #     |> render "error.json", message: "Could not login"
  #   end
  # end

  user = Guardian.Plug.current_resource(conn)
  if user != nil do
    redirect(conn, to: topic_path(conn, :index))
  end
end

def logged_in_action(conn, params) do
  user = Guardian.Plug.current_resource(conn)
  redirect(conn, to: topic_path(conn, :show))
end

def unauthenticated(conn, _params) do
  conn
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
