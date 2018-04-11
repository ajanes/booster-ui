defmodule VisualizerWeb.Router do
  use VisualizerWeb, :router

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

  scope "/", VisualizerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", VisualizerWeb do
    pipe_through :api

    get "/token", ApiController, :token
    get "/nodes", ApiController, :nodes
    get "/addnode", ApiController, :add_node
    get "/addlink", ApiController, :add_link
    get "/updatelink", ApiController, :update_link
    get "/removenode", ApiController, :remove_node
    get "/removelink", ApiController, :remove_link
    get "/reset", ApiController, :reset
    post "/bandwidth", ApiController, :data
  end
end
