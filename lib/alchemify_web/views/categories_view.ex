defmodule AlchemifyWeb.CategoriesView do
  use AlchemifyWeb, :view

  def render("categories.json", %{categories: categories}) do
    render_many(categories, __MODULE__, "category.json")
  end

  def render("category.json", %{categories: category}), do: category

  def render("related.json", %{related: related}) do
    %{
      id: related.category.id,
      name: related.category.name,
      image_url: related.category.image_url,
      albums: render_many(related.albums, AlchemifyWeb.AlbumView, "album.json"),
      songs: render_many(related.songs, AlchemifyWeb.SongView, "song.json"),
      artists: render_many(related.artists, AlchemifyWeb.ArtistView, "artist.json")
    }
  end
end
