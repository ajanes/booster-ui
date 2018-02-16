defmodule VisualizerWeb.ApiView do
  use VisualizerWeb, :view

  def render("data.json", %{data: data}) do
    data
  end
end
