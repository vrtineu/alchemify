defmodule AlchemifyWeb.UserView do
  use AlchemifyWeb, :view

  def render("sign_in.json", %{token: token}) do
    %{token: token}
  end
end
