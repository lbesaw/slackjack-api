defmodule Discuss.SlackUser do
  use Discuss.Web, :model
  @derive {Poison.Encoder, except: [:__meta__, :__struct__]}
  
  schema "slackusers" do
    field :name, :string
    field :real_name, :string
    field :status, :string
    field :color, :string
    field :deleted, :boolean, default: false
    field :is_admin, :boolean, default: false
    field :is_bot, :boolean, default: false
    field :is_owner, :boolean, default: false
    field :is_primary_owner, :boolean, default: false
    field :is_restricted, :boolean, default: false
    field :is_ultra_restricted, :boolean, default: false
    field :team_id, :string
    field :tz, :string
    field :tz_label, :string
    field :tz_offset, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :real_name, :status, :deleted, :is_admin, :is_bot, :is_owner, :is_primary_owner, :is_restricted, :is_ultra_restricted, :team_id, :tz, :tz_label, :tz_offset])
    |> validate_required([:name, :real_name, :status, :deleted, :is_admin, :is_bot, :is_owner, :is_primary_owner, :is_restricted, :is_ultra_restricted, :team_id, :tz, :tz_label, :tz_offset])
  end
end
