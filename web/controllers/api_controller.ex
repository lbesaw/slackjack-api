defmodule Discuss.ApiController do
use Discuss.Web, :controller
plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__

  def logged_in_action(conn, params) do
    user = Guardian.Plug.current_resource(conn)
    conn
    |> put_status(200)
    |> render "success.json", message: "Success!"
  end

  def unauthenticated(conn, _params) do
    conn
    |> IO.inspect
    |> put_status(401)
    |> render "error.json", message: "Authentication required"
  end
end
