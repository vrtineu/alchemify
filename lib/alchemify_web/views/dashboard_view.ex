defmodule AlchemifyWeb.DashboardView do
  use AlchemifyWeb, :view

  def render("index.json", %{dashboard: dashboard}) do
    %{
      recently_played:
        render_many(dashboard.recently_played, AlchemifyWeb.AlbumView, "album.json"),
      recommended: render_many(dashboard.recommended, AlchemifyWeb.AlbumView, "album.json")
    }
  end
end
