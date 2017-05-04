defmodule Discuss.SlackUserControllerTest do
  use Discuss.ConnCase

  alias Discuss.SlackUser
  @valid_attrs %{deleted: true, is_admin: true, is_bot: true, is_owner: true, is_primary_owner: true, is_restricted: true, is_ultra_restricted: true, name: "some content", real_name: "some content", status: "some content", team_id: "some content", tz: "some content", tz_label: "some content", tz_offset: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, slack_user_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    slack_user = Repo.insert! %SlackUser{}
    conn = get conn, slack_user_path(conn, :show, slack_user)
    assert json_response(conn, 200)["data"] == %{"id" => slack_user.id,
      "name" => slack_user.name,
      "real_name" => slack_user.real_name,
      "status" => slack_user.status,
      "deleted" => slack_user.deleted,
      "is_admin" => slack_user.is_admin,
      "is_bot" => slack_user.is_bot,
      "is_owner" => slack_user.is_owner,
      "is_primary_owner" => slack_user.is_primary_owner,
      "is_restricted" => slack_user.is_restricted,
      "is_ultra_restricted" => slack_user.is_ultra_restricted,
      "team_id" => slack_user.team_id,
      "tz" => slack_user.tz,
      "tz_label" => slack_user.tz_label,
      "tz_offset" => slack_user.tz_offset}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, slack_user_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, slack_user_path(conn, :create), slack_user: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(SlackUser, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, slack_user_path(conn, :create), slack_user: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    slack_user = Repo.insert! %SlackUser{}
    conn = put conn, slack_user_path(conn, :update, slack_user), slack_user: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(SlackUser, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    slack_user = Repo.insert! %SlackUser{}
    conn = put conn, slack_user_path(conn, :update, slack_user), slack_user: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    slack_user = Repo.insert! %SlackUser{}
    conn = delete conn, slack_user_path(conn, :delete, slack_user)
    assert response(conn, 204)
    refute Repo.get(SlackUser, slack_user.id)
  end
end
