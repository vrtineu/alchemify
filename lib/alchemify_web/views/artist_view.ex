defmodule AlchemifyWeb.ArtistView do
  use AlchemifyWeb, :view

  alias Alchemify.Schemas.Artist

  def render("artist.json", %{artist: %Artist{} = artist}), do: artist
end
