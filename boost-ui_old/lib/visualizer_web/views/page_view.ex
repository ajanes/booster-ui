defmodule VisualizerWeb.PageView do
  use VisualizerWeb, :view

  def render("data.json", %{data: token}) do
    %{"token" => token}
  end

end
