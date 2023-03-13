defmodule AlchemifyWeb.SongView do
  use AlchemifyWeb, :view

  alias Alchemify.Schemas.Song

  def render("song.json", %{song: %Song{} = song}), do: song
end
