defmodule Discuss.SlackUserTest do
  use Discuss.ModelCase

  alias Discuss.SlackUser

  @valid_attrs %{deleted: true, is_admin: true, is_bot: true, is_owner: true, is_primary_owner: true, is_restricted: true, is_ultra_restricted: true, name: "some content", real_name: "some content", status: "some content", team_id: "some content", tz: "some content", tz_label: "some content", tz_offset: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SlackUser.changeset(%SlackUser{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SlackUser.changeset(%SlackUser{}, @invalid_attrs)
    refute changeset.valid?
  end
end
