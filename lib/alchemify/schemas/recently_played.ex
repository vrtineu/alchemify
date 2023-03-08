defmodule Alchemify.Schemas.RecentlyPlayed do
  use Ecto.Schema

  alias Alchemify.Schemas.{Album, User}

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "recently_played" do
    belongs_to :user, User

    many_to_many :albums, Album, join_through: "recently_played_albums"
  end
end
