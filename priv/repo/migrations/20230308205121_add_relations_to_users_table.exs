defmodule Alchemify.Repo.Migrations.AddRelationsToUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :recently_played_id, references(:recently_played, type: :binary_id)
    end
  end
end
