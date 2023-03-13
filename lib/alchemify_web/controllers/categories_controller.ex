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
end
