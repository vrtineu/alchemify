defmodule Alchemify.Repo.Migrations.CreateRecentlyPlayedTable do
  use Ecto.Migration

  def change do
    create table(:recently_played) do
      add :user_id, references(:users, type: :binary_id)
    end
  end
end
