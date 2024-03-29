defmodule Discuss.Topic do
  use Discuss.Web, :model
  @derive {Poison.Encoder, except: [:__meta__, :__struct__]}

  schema "topics" do
    field :title, :string
    belongs_to :user, Discuss.User
    has_many :comments, Discuss.Comment
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
