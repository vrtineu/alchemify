defmodule Alchemify.Schemas.Album do
  use Ecto.Schema

  import Ecto.Changeset

  alias Alchemify.Schemas.{Artist, Category, Favorite, RecentlyPlayed, Song}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_fields ~w(title date category_id artist_id cover_url)a

  schema "albums" do
    field :title, :string
    field :date, :date
    field :cover_url, :string

    belongs_to :artist, Artist
    belongs_to :category, Category

    has_many :songs, Song

    many_to_many :recently_played, RecentlyPlayed, join_through: "recently_played_albums"
    many_to_many :favorites, Favorite, join_through: "songs_albums_artists_favorites"

    timestamps()
  end

  def changeset(album \\ %__MODULE__{}, attrs) do
    album
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
