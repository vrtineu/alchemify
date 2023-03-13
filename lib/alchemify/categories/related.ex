defmodule Alchemify.Categories.Related do
  import Ecto.Query

  alias Alchemify.{Error, Repo}
  alias Alchemify.Schemas.{Album, Artist, Category, Song}

  def fetch(category_id) do
    with category <- Repo.get(Category, category_id),
         {:ok, songs} <- related_songs(category_id),
         {:ok, albums} <- related_albums(category_id),
         {:ok, artists} <- related_artists(category_id) do
      {:ok, related_results(category, songs, albums, artists)}
    else
      _ -> {:error, Error.build(:not_found, "Category not found")}
    end
  end

  defp related_results(category, songs, albums, artists) do
    %{category: category, songs: songs, albums: albums, artists: artists}
  end

  defp related_artists(category_id) do
    query =
      from artist in Artist,
        join: album in assoc(artist, :albums),
        join: category in assoc(album, :category),
        distinct: artist.id,
        where: category.id == ^category_id

    {:ok, Repo.all(query)}
  end

  defp related_songs(category_id) do
    query =
      from song in Song,
        join: album in assoc(song, :album),
        join: category in assoc(album, :category),
        distinct: song.id,
        where: category.id == ^category_id

    {:ok, Repo.all(query)}
  end

  defp related_albums(category_id) do
    query =
      from album in Album,
        join: category in assoc(album, :category),
        distinct: album.id,
        where: category.id == ^category_id

    {:ok, Repo.all(query)}
  end
end
