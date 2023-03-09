defmodule Alchemify.Repo.Migrations.AddRelationsToSongsTable do
  use Ecto.Migration

  def change do
    alter table(:songs) do
      add :album_id, references(:albums, type: :binary_id)
    end
  end
end
