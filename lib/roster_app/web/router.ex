defmodule RosterApp.Web.Router do
  use RosterApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RosterApp.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/shifts", ShiftController
    resources "/rosters", RosterController
    resources "/organisations", OrganisationController
  end

  # Other scopes may use custom stacks.
  # scope "/api", RosterApp.Web do
  #   pipe_through :api
  # end
end
