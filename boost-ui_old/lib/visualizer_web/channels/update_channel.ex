defmodule VisualizerWeb.UpdateChannel do
  use Phoenix.Channel

  def join("update:graph", _payload, socket) do
    {:ok, socket}
  end

  def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end
end