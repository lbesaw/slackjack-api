defmodule Discuss.SlackUserView do
  use Discuss.Web, :view

  def render("index.json", %{slackusers: slackusers}) do
    %{data: render_many(slackusers, Discuss.SlackUserView, "slack_user.json")}
  end

  def render("show.json", %{slack_user: slack_user}) do
    %{data: render_one(slack_user, Discuss.SlackUserView, "slack_user.json")}
  end

  def render("slack_user.json", %{slack_user: slack_user}) do
    %{id: slack_user.id,
      name: slack_user.name,
      real_name: slack_user.real_name,
      status: slack_user.status,
      deleted: slack_user.deleted,
      is_admin: slack_user.is_admin,
      is_bot: slack_user.is_bot,
      is_owner: slack_user.is_owner,
      is_primary_owner: slack_user.is_primary_owner,
      is_restricted: slack_user.is_restricted,
      is_ultra_restricted: slack_user.is_ultra_restricted,
      team_id: slack_user.team_id,
      tz: slack_user.tz,
      tz_label: slack_user.tz_label,
      tz_offset: slack_user.tz_offset}
  end
end
