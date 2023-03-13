defmodule Alchemify.Schemas.Category do
  use Ecto.Schema

  import Ecto.Changeset

  alias Alchemify.Schemas.Album

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields ~w(name image_url)a

  @json_fields ~w(id name image_url)a

  @derive {Jason.Encoder, only: @json_fields}

  schema "categories" do
    field :name, :string
    field :image_url, :string

    has_many :albums, Album

    timestamps()
  end

  def changeset(category \\ %__MODULE__{}, attrs) do
    category
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
