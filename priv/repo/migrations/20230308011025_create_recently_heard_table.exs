defmodule Alchemify.Repo.Migrations.CreateRecentlyHeardTable do
  use Ecto.Migration

  def change do
    create table(:recently_heards) do
      add :album_id, references(:albums, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end
