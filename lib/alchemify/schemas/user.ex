defmodule Alchemify.Schemas.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Alchemify.Schemas.{Favorite, RecentlyPlayed}
  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields ~w(name email password)a

  @derive {Jason.Encoder, only: @required_fields ++ [:id]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    has_many :favorites, Favorite
    has_one :recently_played, RecentlyPlayed

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> hash_password()
  end

  defp hash_password(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    with password <- Pbkdf2.add_hash(password),
         change <- change(changeset, password) do
      change
    end
  end
end
