defmodule Discuss.ApiController do
use Discuss.Web, :controller
plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__
alias Discuss.User

  def logged_in_action(conn, params) do
    user = Guardian.Plug.current_resource(conn)
    conn
    |> put_status(200)
    |> render "success.json", message: "Success!"
  end

  def retrieve_user(conn, %{"id" => id}) do
    case Repo.get_by(User, id: id) do
      nil -> render(conn, "error.json", message: "No user")

      user ->
        conn
        |> put_status(200)
        |> render "success.json", message: Poison.encode!(user)
    end


  end

  def unauthenticated(conn, _params) do
    conn
    |> IO.inspect
    |> put_status(401)
    |> render "error.json", message: "Authentication required"
  end
end
