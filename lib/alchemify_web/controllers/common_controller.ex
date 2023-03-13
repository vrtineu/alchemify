defmodule AlchemifyWeb.CommonController do
  use AlchemifyWeb, :controller

  action_fallback AlchemifyWeb.FallbackController

  def dashboard(conn, _attrs) do
    user = conn.private[:guardian_default_resource]

    # TODO: The dashboard should return a struct with the complete data
    # for now all relations aren't loaded and we need to return the artist names too
    with dashboard <- Alchemify.dashboard(user.id) do
      conn
      |> put_status(:ok)
      |> render("dashboard.json", dashboard: dashboard)
    end
  end

  def search(conn, attrs) do
    with {:ok, results} <- Alchemify.search(attrs) do
      conn
      |> put_status(:ok)
      |> render("search.json", results: results)
    end
  end
end
