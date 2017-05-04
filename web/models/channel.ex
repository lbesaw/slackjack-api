defmodule Discuss.Channel do
  use Discuss.Web, :model
  @derive {Poison.Encoder, except: [:__meta__, :__struct__]}

  schema "channels" do
    field :name, :string
    field :name_normalized, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :name_normalized])
    |> validate_required([:name, :name_normalized])
  end
end
