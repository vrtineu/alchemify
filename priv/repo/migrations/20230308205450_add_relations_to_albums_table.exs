defmodule Alchemify.Repo.Migrations.AddRelationsToAlbumsTable do
  use Ecto.Migration

  def change do
    alter table(:albums) do
      add :category_id, references(:categories, type: :binary_id)
      add :artist_id, references(:artists, type: :binary_id)
    end
  end
end
