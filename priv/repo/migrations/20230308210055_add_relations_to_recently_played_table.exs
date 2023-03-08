defmodule Alchemify.Repo.Migrations.AddRelationsToRecentlyPlayedTable do
  use Ecto.Migration

  def change do
    alter table(:recently_played) do
      add :recently_played_albums_id, references(:recently_played_albums, type: :binary_id)
    end
  end
end
