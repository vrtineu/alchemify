defmodule AlchemifyWeb.UsersController do
  use AlchemifyWeb, :controller

  alias AlchemifyWeb.Auth.Guardian

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end
end
