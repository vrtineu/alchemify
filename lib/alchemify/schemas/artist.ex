defmodule Alchemify.Schemas.Artist do
  use Ecto.Schema

  import Ecto.Changeset

  alias Alchemify.Schemas.Album

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields ~w(name)a

  schema "artists" do
    field :name, :string

    has_many :albums, Album
  end

  def changeset(artist, attrs) do
    artist
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
