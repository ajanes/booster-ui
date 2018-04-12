defmodule BoosterUiWeb.ApiController do
  use BoosterUiWeb, :controller
  require Logger
  alias BoosterUi.Repo

  def token(conn, %{}) do
    Logger.debug "Creating a UUID"
    data = %{"token" => Repo.generate_uuid()}
    conn
    |>render("data.json", data: data)
  end

  def bandwidth(conn, %{"token" => token, "bandwidth" => bandwidth}) do
    Logger.debug "Bandwidth of token #{token} : #{bandwidth}"

    conn
    |>render("data.json", data: token)
  end

end
