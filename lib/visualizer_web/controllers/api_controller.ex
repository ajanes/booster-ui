defmodule VisualizerWeb.ApiController do
  use VisualizerWeb, :controller
  require Logger
  alias Visualizer.Data

  def nodes(conn, _params) do
    conn
    |> render("data.json", data: Data.get())
  end

  def add_node(conn, %{"name" => name, "group" => group, "parent" => parent, "workload" => workload, "distance" => distance}) do
    Logger.debug "Adding node #{name} at parent #{parent} with distance #{distance}."

    Data.add_node(name, group, parent, workload, distance)
    VisualizerWeb.Endpoint.broadcast("update:graph", "update_message", %{command: "add_node", name: name, group: group})
    VisualizerWeb.Endpoint.broadcast("update:graph", "update_message", %{command: "add_link", from: parent, to: name, workload: workload, distance: distance})

    conn
    |> render("data.json", data: Data.get())
  end

  def add_node(conn, %{"name" => name, "group" => group}) do
    Logger.debug "Adding node #{name} at the client belonging to group #{group}."

    Data.add_node(name, group)
    VisualizerWeb.Endpoint.broadcast("update:graph", "update_message", %{command: "add_node", name: name, group: group})

    conn
    |> render("data.json", data: Data.get())
  end

  def add_link(conn, %{"from" => from, "to" => to, "workload" => workload, "distance" => distance}) do
    Logger.debug "Adding link from #{from} to #{to} with workload #{workload} and distance #{distance}."

    Data.add_link(from, to, workload, distance)
    VisualizerWeb.Endpoint.broadcast("update:graph", "update_message", %{command: "add_link", from: from, to: to, workload: workload, distance: distance})

    conn
    |> render("data.json", data: Data.get())
  end

  def update_link(conn, %{"from" => from, "to" => to, "workload" => workload, "distance" => distance}) do
    Logger.debug "Updating link from #{from} to #{to} with workload #{workload} and distance #{distance}."

    Data.update_link(from, to, workload, distance)
    VisualizerWeb.Endpoint.broadcast("update:graph", "update_message", %{command: "update_link", from: from, to: to, workload: workload, distance: distance})

    conn
    |> render("data.json", data: Data.get())
  end

  def remove_node(conn, %{"name" => name}) do
    Logger.debug "Removing node #{name}."

    Data.remove_node(name)
    VisualizerWeb.Endpoint.broadcast("update:graph", "update_message", %{command: "remove_node", name: name})

    conn
    |> render("data.json", data: Data.get())
  end

  def remove_link(conn, %{"from" => from, "to" => to}) do
    Logger.debug "Removing link from #{from} to #{to}."

    Data.remove_link(from, to)
    VisualizerWeb.Endpoint.broadcast("update:graph", "update_message", %{command: "remove_node", from: from, to: to})

    conn
    |> render("data.json", data: Data.get())
  end

  def reset(conn, _params) do
    Logger.debug "Removing all nodes."

    Data.reset
    VisualizerWeb.Endpoint.broadcast("update:graph", "update_message", %{command: "reset"})

    conn
    |> render("data.json", data: Data.get())
  end

  def token(conn, %{}) do
    Logger.debug "Creating a UUID"

    conn
    |>render("data.json", data: Data.generate_uuid())
  end

  def bandwidth(conn, %{"token" => token}) do
    Logger.debug "Updating data of token #{token}"
  end

end
