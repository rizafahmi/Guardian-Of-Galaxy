defmodule GuardianOfGalaxy.Router do
  use GuardianOfGalaxy.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :require_login do
    plug Guardian.Plug.EnsureAuthenticated, handler: GuardianOfGalaxy.GuardianErrorHandler
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GuardianOfGalaxy do
    pipe_through [:browser, :browser_session] # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
  end

  scope "/", GuardianOfGalaxy do
    pipe_through [:browser, :browser_session, :require_login]

    get "/secret", PageController, :secret
  end

  # Other scopes may use custom stacks.
  # scope "/api", GuardianOfGalaxy do
  #   pipe_through :api
  # end
end
