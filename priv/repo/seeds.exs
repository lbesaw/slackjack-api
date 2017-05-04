# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Discuss.Repo.insert!(%Discuss.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

for i <- 1..20 do
  Discuss.Repo.insert!(%Discuss.Channel{
    id: i,
    name: "CSBA55#{i}",
    name_normalized: "Channel #{i}"
    })
  Discuss.Repo.insert!(%Discuss.SlackUser{
    id: i,
    name: "Name #{i}",
    real_name: "Realname #{i}",
    status: "Online",
    color: "red",
    deleted: false,
    is_admin: false,
    is_bot: false,
    is_owner: false,
    is_primary_owner: false,
    is_restricted: false,
    is_ultra_restricted: false,
    team_id: "1",
    tz: "0",
    tz_label: "label 0",
    tz_offset: 500
    })
  Discuss.Repo.insert!(%Discuss.Message{
    id: i,
    text: "THIS IS A MESSAGE, #{i}",
    channel_id: i,
    user_id: i
    })
  end
  for i <- 21..30 do
    Discuss.Repo.insert!(%Discuss.Message{
      id: i,
      text: "MESSAGES BELONGING TO USER 10",
      channel_id: 5,
      user_id: 10
    })
  end
