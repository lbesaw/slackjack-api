defmodule Discuss.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add :id, :integer, primary_key: true
      add :text, :string

      add :channel_id, references(:channels, on_delete: :delete_all, type: :integer)
      add :user_id, references(:slackusers, on_delete: :delete_all, type: :integer)

      timestamps()
    end

    create index(:messages, [:channel_id])

  end
end
