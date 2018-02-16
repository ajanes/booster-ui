defmodule VisualizerWeb.PageController do
  use VisualizerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
