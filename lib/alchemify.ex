defmodule Alchemify do
  @moduledoc """
  Alchemify keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  # common
  defdelegate dashboard(id), to: Alchemify.Common.Dashboard, as: :index
  defdelegate search(query), to: Alchemify.Common.Search, as: :search

  # categories
  defdelegate categories, to: Alchemify.Categories.Get, as: :all
  defdelegate related_categories(category_id), to: Alchemify.Categories.Related, as: :fetch
end
