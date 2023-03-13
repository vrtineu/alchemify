defmodule AlchemifyWeb.CommonView do
  use AlchemifyWeb, :view

  def render("dashboard.json", %{dashboard: dashboard}) do
    %{
      recently_played:
        render_many(dashboard.recently_played, AlchemifyWeb.AlbumView, "album.json"),
      recommended: render_many(dashboard.recommended, AlchemifyWeb.AlbumView, "album.json")
    }
  end

  def render("search.json", %{results: results}) do
    %{
      albums: render_many(results.albums, AlchemifyWeb.AlbumView, "album.json"),
      songs: render_many(results.songs, AlchemifyWeb.SongView, "song.json"),
      artists: render_many(results.artists, AlchemifyWeb.ArtistView, "artist.json")
    }
  end
end
