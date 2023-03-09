defmodule Alchemify.Repo.Migrations.CreateFavoriteTable do
  use Ecto.Migration

  def change do
    create table(:favorites) do
      add :user_id, references(:users, type: :binary_id)

      add :favoritable_type, :string

      timestamps()
    end
  end
end
