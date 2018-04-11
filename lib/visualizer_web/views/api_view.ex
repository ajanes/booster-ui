defmodule VisualizerWeb.ApiView do
  use VisualizerWeb, :view

  def render("data.json", %{data: token}) do
    %{"token"=> token}
  end
end
