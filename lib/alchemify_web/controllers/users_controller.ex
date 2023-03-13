defmodule AlchemifyWeb.UsersController do
  use AlchemifyWeb, :controller

  alias AlchemifyWeb.Auth.Guardian

  action_fallback AlchemifyWeb.FallbackController

  def sign_in(conn, attrs) do
    with {:ok, token} <- Guardian.authenticate(attrs) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end
end
