defmodule Discuss.Message do
  use Discuss.Web, :model
  @derive {Poison.Encoder, except: [:__meta__, :__struct__]}

  schema "messages" do
    field :text, :string
    field :channel_id, :integer
    field :user_id, :integer
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:text, :channel_id, :user_id])
    |> validate_required([:text])
  end
end
