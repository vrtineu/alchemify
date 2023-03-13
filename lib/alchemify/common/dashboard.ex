defmodule Alchemify.Common.Dashboard do
  import Ecto.Query

  alias Alchemify.Repo
  alias Alchemify.Schemas.{Album, Category, RecentlyPlayed}

  def index(id) do
    %{
      recently_played: recently_played(id),
      recommended: recommended(id)
    }
  end

  defp recently_played(id) do
    query =
      from recently in RecentlyPlayed,
        where: recently.user_id == ^id,
        order_by: [desc: recently.inserted_at],
        limit: 4

    query
    |> Repo.all()
    |> Repo.preload([:albums])
    |> Enum.map(& &1.albums)
    |> Enum.flat_map(& &1)
  end

  defp recommended(id) do
    albums = recently_played(id)

    categories =
      albums
      |> Enum.map(&Repo.preload(&1, [:category]))
      |> Enum.map(& &1.category)

    fetch_recommendations(categories, albums)
  end

  defp fetch_recommendations([%Category{} | _] = categories, [%Album{} | _] = albums) do
    query =
      from album in Album,
        where: album.category_id in ^categories and album.id not in ^Enum.map(albums, & &1.id),
        distinct: true,
        order_by: [asc: fragment("random()")],
        limit: 12

    fetch(query)
  rescue
    _ -> fetch_recommendations([], albums)
  end

  defp fetch_recommendations(_, _) do
    query =
      from album in Album,
        order_by: [asc: fragment("random()")],
        limit: 12

    fetch(query)
  end

  defp fetch(query) do
    query
    |> Repo.all()
    |> Repo.preload([:artist, :category])
  end
end
