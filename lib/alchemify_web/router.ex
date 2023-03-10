defmodule AlchemifyWeb.Router do
  use AlchemifyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug AlchemifyWeb.Auth
  end

  scope "/api", AlchemifyWeb do
    pipe_through :api

    post "/sign-in", UsersController, :sign_in
  end

  scope "/api", AlchemifyWeb do
    pipe_through [:api, :auth]
  end
end
