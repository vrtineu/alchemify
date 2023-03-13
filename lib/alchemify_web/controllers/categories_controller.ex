defmodule AlchemifyWeb.CategoriesController do
  use AlchemifyWeb, :controller

  action_fallback AlchemifyWeb.FallbackController

  def index(conn, _attrs) do
    with {:ok, categories} <- Alchemify.categories() do
      conn
      |> put_status(:ok)
      |> render("categories.json", categories: categories)
    end
  end

  def related(conn, %{"id" => id}) do
    with {:ok, %{albums: albums, artists: artists, category: category, songs: songs}} <-
           Alchemify.related_categories(id) do
      conn
      |> put_status(:ok)
      |> render("related.json",
        related: %{albums: albums, artists: artists, category: category, songs: songs}
      )
    end
  end
end
