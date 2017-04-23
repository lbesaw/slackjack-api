
defimpl Poison.Encoder, for: Ecto.Association.NotLoaded do
  def encode(_struct, _options) do
    "null"
  end
end
