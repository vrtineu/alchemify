defmodule Alchemify.Categories.Get do
  alias Alchemify.Repo
  alias Alchemify.Schemas.Category

  def all, do: {:ok, Repo.all(Category)}
end
