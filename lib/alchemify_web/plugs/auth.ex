defmodule AlchemifyWeb.Auth do
  use Guardian.Plug.Pipeline, otp_app: :alchemify

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
