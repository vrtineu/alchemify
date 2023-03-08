defmodule Alchemify.Repo.Migrations.AddMissedFieldsToTables do
  use Ecto.Migration

  def change do
    alter table(:albums) do
      add :cover_url, :string
    end

    alter table(:artists) do
      add :photo_url, :string
    end

    alter table(:categories) do
      add :image_url, :string
    end

    alter table(:songs) do
      add :file_url, :string
    end
  end
end
