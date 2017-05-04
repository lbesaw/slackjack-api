defmodule Discuss.ApiView do
  use Discuss.Web, :view
  def render("user.json", %{user: user}) do
    user
  end

  def render("message.json", %{message: message}) do
    message
  end
end
