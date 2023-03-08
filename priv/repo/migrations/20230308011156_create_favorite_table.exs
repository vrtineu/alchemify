defmodule Alchemify.Repo.Migrations.CreateFavoriteTable do
  use Ecto.Migration

  def change do
    create table(:favorites) do
      add :user_id, references(:users, type: :binary_id)

      # favoritable is a polymorphic association
      add :song_id, references(:songs, type: :binary_id)
      add :album_id, references(:albums, type: :binary_id)
      add :artist_id, references(:artists, type: :binary_id)

      add :favoritable_type, :string

      timestamps()
    end
  end
end
