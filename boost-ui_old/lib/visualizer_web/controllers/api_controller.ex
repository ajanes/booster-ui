defmodule VisualizerWeb.ApiController do
  use VisualizerWeb, :controller
  require Logger
  alias Visualizer.Data

  def token(conn, %{}) do
    Logger.debug "Creating a UUID"
    data = %{"token" => Data.generate_uuid()}
    conn
    |>render("data.json", data: data)
  end

  def bandwidth(conn, %{"token" => token, "bandwidth" => bandwidth}) do
    Logger.debug "Bandwidth of token #{token} : #{bandwidth}"

    conn
    |>render("data.json", data: token)
  end

  def node(conn, param) do
    Logger.debug "Node"
    conn
    |>render("data.json", data: Data.get())
  end

end
