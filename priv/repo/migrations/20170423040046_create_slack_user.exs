defmodule Discuss.Repo.Migrations.CreateSlackUser do
  use Ecto.Migration

  def change do
    create table(:slackusers, primary_key: false) do
      add :id, :integer, primary_key: true
      add :name, :string
      add :real_name, :string
      add :color, :string
      add :status, :string
      add :deleted, :boolean, default: false, null: false
      add :is_admin, :boolean, default: false, null: false
      add :is_bot, :boolean, default: false, null: false
      add :is_owner, :boolean, default: false, null: false
      add :is_primary_owner, :boolean, default: false, null: false
      add :is_restricted, :boolean, default: false, null: false
      add :is_ultra_restricted, :boolean, default: false, null: false
      add :team_id, :string
      add :tz, :string
      add :tz_label, :string
      add :tz_offset, :integer

      timestamps()
    end

  end
end
