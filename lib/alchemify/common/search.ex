defmodule Alchemify.Common.Search do
  import Ecto.Query

  alias Alchemify.Repo
  alias Alchemify.Schemas.{Album, Artist, Song}

  def search(%{"query" => query}), do: search_when_query_is_not_empty(query)
  def search(%{}), do: search_when_query_is_empty()

  defp mount_search_results(albums, songs, artists) do
    %{albums: albums, songs: songs, artists: artists}
  end

  defp search_when_query_is_empty do
    albums = fetch_albums()
    songs = fetch_songs()
    artists = fetch_artists()

    {:ok, mount_search_results(albums, songs, artists)}
  end

  defp search_when_query_is_not_empty(search_param) do
    albums = fetch_albums(search_param)
    songs = fetch_songs(search_param)
    artists = fetch_artists(search_param)

    {:ok, mount_search_results(albums, songs, artists)}
  end

  defp fetch_albums(query_param \\ "") do
    query =
      from a in Album,
        where: ilike(a.title, ^"%#{query_param}%")

    Repo.all(query)
  end

  defp fetch_songs(query_param \\ "") do
    query =
      from s in Song,
        where: ilike(s.title, ^"%#{query_param}%")

    Repo.all(query)
  end

  defp fetch_artists(query_param \\ "") do
    query =
      from a in Artist,
        where: ilike(a.name, ^"%#{query_param}%")

    Repo.all(query)
  end
end
