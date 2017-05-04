defmodule Discuss.Repo.Migrations.CreateChannel do
  use Ecto.Migration

  def change do
    create table(:channels, primary_key: false) do
      add :id, :integer, primary_key: true
      add :name, :string
      add :name_normalized, :string
      timestamps()
    end
  end
end
