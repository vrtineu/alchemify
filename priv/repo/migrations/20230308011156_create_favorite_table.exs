defmodule Alchemify.Repo.Migrations.CreateFavoriteTable do
  use Ecto.Migration

  def change do
    create table(:favorites) do
      add :user_id, references(:users, on_delete: :delete_all)

      # favoritable is a polymorphic association
      add :favoritable_song_id, references(:songs, on_delete: :delete_all)
      add :favoritable_album_id, references(:albums, on_delete: :delete_all)
      add :favoritable_artist_id, references(:artists, on_delete: :delete_all)

      timestamps()
    end
  end
end
