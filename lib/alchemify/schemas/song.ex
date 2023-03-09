defmodule Alchemify.Schemas.Song do
  use Ecto.Schema

  import Ecto.Changeset

  alias Alchemify.Schemas.{Album, Favorite}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_fields ~w(title file_url)a

  schema "songs" do
    field :title, :string
    field :file_url, :string
    field :played_times, :integer, default: 0

    belongs_to :album, Album
    many_to_many :favorites, Favorite, join_through: "songs_albums_artists_favorites"

    timestamps()
  end

  def changeset(song \\ %__MODULE__{}, attrs) do
    song
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
