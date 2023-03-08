defmodule Alchemify.Schemas.Favorite do
  use Ecto.Schema

  import Ecto.Changeset

  alias Alchemify.Schemas.{Album, Artist, Song, User}

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields ~w(favoritable_type)a

  @fields ~w(id user_id song_id album_id artist_id favoritable_type)a

  @derive {Jason.Encoder, only: @fields}

  schema "favorites" do
    belongs_to :user, User
    belongs_to :song, Song
    belongs_to :album, Album
    belongs_to :artist, Artist

    field :favoritable_type, :string

    timestamps()
  end

  def changeset(favorite \\ %__MODULE__{}, attrs) do
    favorite
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
