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
    get "/bandwidth", PageController, :bandwidth
  end

  scope "/api", VisualizerWeb do
    pipe_through :api

    get "/token", ApiController, :token
    post "/bandwidth", ApiController, :bandwidth
    post "/node", ApiController, :node
  end
end
