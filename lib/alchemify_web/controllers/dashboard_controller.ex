defmodule AlchemifyWeb.DashboardController do
  use AlchemifyWeb, :controller

  action_fallback AlchemifyWeb.FallbackController

  def index(conn, _attrs) do
    user = conn.private[:guardian_default_resource]

    # TODO: The dashboard should return a struct with the complete data
    # for now all relations aren't loaded and we need to return the artist names too
    with dashboard <- Alchemify.dashboard(user.id) do
      conn
      |> put_status(:ok)
      |> render("dashboard.json", dashboard: dashboard)
    end
  end
end
