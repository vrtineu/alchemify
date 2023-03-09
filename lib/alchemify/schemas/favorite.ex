defmodule Alchemify.Schemas.Favorite do
  use Ecto.Schema

  import Ecto.Changeset

  alias Alchemify.Schemas.{Album, Artist, Song, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_fields ~w(favoritable_type)a

  @fields ~w(id user_id favoritable_type)a

  @derive {Jason.Encoder, only: @fields}

  schema "favorites" do
    field :favoritable_type, :string

    belongs_to :user, User

    many_to_many :songs, Song, join_through: "songs_albums_artists_favorites"
    many_to_many :albums, Album, join_through: "songs_albums_artists_favorites"
    many_to_many :artists, Artist, join_through: "songs_albums_artists_favorites"

    timestamps()
  end

  def changeset(favorite \\ %__MODULE__{}, attrs) do
    favorite
    |> cast(attrs, @required_fields)
  end
end
