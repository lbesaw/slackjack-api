defmodule Discuss.SlackUserController do
  use Discuss.Web, :controller

  alias Discuss.SlackUser

  def index(conn, _params) do
    slackusers = Repo.all(SlackUser)
    render(conn, "index.json", slackusers: slackusers)
  end

  def create(conn, %{"slack_user" => slack_user_params}) do
    changeset = SlackUser.changeset(%SlackUser{}, slack_user_params)

    case Repo.insert(changeset) do
      {:ok, slack_user} ->
        conn
        |> put_status(:created)
        |> render("show.json", slack_user: slack_user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Discuss.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    slack_user = Repo.get!(SlackUser, id)
    render(conn, "show.json", slack_user: slack_user)
  end

  def update(conn, %{"id" => id, "slack_user" => slack_user_params}) do
    slack_user = Repo.get!(SlackUser, id)
    changeset = SlackUser.changeset(slack_user, slack_user_params)

    case Repo.update(changeset) do
      {:ok, slack_user} ->
        render(conn, "show.json", slack_user: slack_user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Discuss.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    slack_user = Repo.get!(SlackUser, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(slack_user)

    send_resp(conn, :no_content, "")
  end
end
