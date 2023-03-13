defmodule Alchemify do
  @moduledoc """
  Alchemify keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  # dashboard
  defdelegate dashboard(id), to: Alchemify.Dashboard, as: :index

  # categories
  defdelegate categories, to: Alchemify.Categories.Get, as: :all
end
