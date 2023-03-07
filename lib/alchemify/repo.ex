defmodule Alchemify.Repo do
  use Ecto.Repo,
    otp_app: :alchemify,
    adapter: Ecto.Adapters.Postgres
end
