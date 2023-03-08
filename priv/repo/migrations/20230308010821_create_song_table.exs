defmodule Alchemify.Repo.Migrations.CreateSongTable do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :title, :string
      add :played_times, :integer, default: 0
      add :album_id, references(:albums, on_delete: :delete_all)

      timestamps()
    end
  end
end
