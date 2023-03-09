defmodule Alchemify.Repo.Migrations.CreateSongsAlbumsArtistsFavoritesTable do
  use Ecto.Migration

  def change do
    create table(:songs_albums_artists_favorites, primary_key: false) do
      add :song_id, references(:songs, type: :binary_id), null: true
      add :album_id, references(:albums, type: :binary_id), null: true
      add :artist_id, references(:artists, type: :binary_id), null: true
      add :favorite_id, references(:favorites, type: :binary_id), null: true
    end
  end
end
