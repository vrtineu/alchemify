defmodule AlchemifyWeb.CategoryView do
  use AlchemifyWeb, :view

  def render("categories.json", %{categories: categories}) do
    render_many(categories, __MODULE__, "category.json")
  end

  def render("category.json", %{categories: category}), do: category
end
