defmodule Alchemify.Repo.Migrations.CreateAlbumTable do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :title, :string
      add :date, :date
      add :category_id, references(:categories, on_delete: :delete_all)
      add :artist_id, references(:artists, on_delete: :delete_all)

      timestamps()
    end
  end
end
