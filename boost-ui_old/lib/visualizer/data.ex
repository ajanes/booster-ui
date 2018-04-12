defmodule Visualizer.Data do
  require Logger

  defp initial_state() do
    %{nodes: [], links: []}
  end

  def start_link() do
    Agent.start_link(fn -> initial_state() end, name: __MODULE__)
  end

  def get() do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def generate_uuid() do
    UUID.uuid4()
  end


end
