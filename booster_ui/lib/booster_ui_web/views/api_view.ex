defmodule BoosterUiWeb.ApiView do
  use BoosterUiWeb, :view

  def render("data.json", %{data: data}) do
    data
  end
end
