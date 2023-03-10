defmodule Alchemify.Users.Get do
  alias Alchemify.Repo
  alias Alchemify.Schemas.User

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  def by_email(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
