defmodule AlchemifyWeb.AlbumView do
  use AlchemifyWeb, :view

  alias Alchemify.Schemas.Album

  def render("album.json", %{album: %Album{} = album}), do: album
end
