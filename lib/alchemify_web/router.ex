defmodule AlchemifyWeb.Router do
  use AlchemifyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AlchemifyWeb do
    pipe_through :api
  end
end
