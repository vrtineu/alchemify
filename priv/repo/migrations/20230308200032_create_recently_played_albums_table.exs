defmodule Alchemify.Repo.Migrations.CreateRecentlyPlayedAlbumsTable do
  use Ecto.Migration

  def change do
    create table(:recently_played_albums) do
      add :recently_played_id, references(:recently_played, type: :binary_id)
      add :album_id, references(:albums, type: :binary_id)
    end
  end
end
