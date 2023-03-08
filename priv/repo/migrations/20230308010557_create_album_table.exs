defmodule Alchemify.Repo.Migrations.CreateAlbumTable do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :title, :string
      add :date, :naive_datetime

      timestamps()
    end
  end
end
