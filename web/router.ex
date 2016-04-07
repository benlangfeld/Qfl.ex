defmodule Queueflex.Router do
  @moduledoc false

  use Queueflex.Web, :router

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

  scope "/", Queueflex do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api" do
    get "/browser", Absinthe.Plug.GraphiQL, schema: Queueflex.Web.Schema
    forward "/", Absinthe.Plug, schema: Queueflex.Web.Schema
  end
end
