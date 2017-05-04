defmodule Discuss.ApiController do
use Discuss.Web, :controller
plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__
alias Discuss.SlackUser

  def logged_in_action(conn, params) do
    user = Guardian.Plug.current_resource(conn)
    conn
    |> put_status(200)
    |> render "success.json", message: "Success!"
  end

  def retrieve_messages(conn, %{"id" => id}) do
    id = String.to_integer(id)

    case Repo.all(from x in Discuss.Message, where: x.user_id == ^id) do
      nil -> render(conn, "error.json", message: "No user")

      message ->
        conn
        |> put_status(200)
        |> render "message.json", message: message
      end
  end

  def retrieve_user(conn, %{"id" => id, "include" => include}) do
    includes =
      include
      |> String.split(",")
      |> Enum.map(&String.to_atom/1)

    # user = Repo.get(SlackUser, id: String.to_integer(id))
    # |> Repo.preload(includes)
    #
    # conn
    # |> put_status(200)
    # |> render "user.json", user: user
    case Repo.get_by(SlackUser, id: String.to_integer(id)) do

      nil -> render(conn, "error.json", message: "No user")

      slackuser ->
        # slackuser = Repo.preload(slackuser, includes)

        conn
        |> put_status(200)
        |> render "user.json", user: slackuser
    end


  end

  def unauthenticated(conn, _params) do
    conn
    |> IO.inspect
    |> put_status(401)
    |> render "error.json", message: "Authentication required"
  end
end
