defmodule Visualizer.Data do    
  require Logger

  defp initial_state() do
    %{nodes: [], links: []}
  end

  def start_link() do
    Agent.start_link(fn -> initial_state() end, name: __MODULE__)
  end

  def add_node(name, group) do
    Agent.update(__MODULE__, fn state -> 
      %{nodes: nodes, links: links} = state

      nodes = Enum.filter(nodes, fn(x) -> x.name != name end)
      nodes = nodes ++ [%{name: name, group: group}]    
      
      %{nodes: nodes, links: links}
    end)
  end

  def add_node(name, group, parent, workload, distance) do
    Agent.update(__MODULE__, fn state -> 
      %{nodes: nodes, links: links} = state

      nodes = Enum.filter(nodes, fn(x) -> x.name != name end)
      nodes = nodes ++ [%{name: name, group: group}]    
      links = Enum.filter(links, fn(x) -> x.from != name end)
      links = Enum.filter(links, fn(x) -> x.to != name end)
      links = links ++ [%{from: parent, to: name, workload: workload, distance: distance}]    
      
      %{nodes: nodes, links: links}
    end)
  end

  def add_link(from, to, workload, distance) do
    Agent.update(__MODULE__, fn state -> 
      %{nodes: nodes, links: links} = state

      links = Enum.filter(links, fn(x) -> !(x.from == from and x.to == to) end)
      links = Enum.filter(links, fn(x) -> !(x.from == to and x.to == from) end)
      links = links ++ [%{from: from, to: to, workload: workload, distance: distance}]    
      
      %{nodes: nodes, links: links}
    end)
  end
  
  def remove_node(name) do
    Agent.update(__MODULE__, fn state ->
      %{nodes: nodes, links: links} = state

      links = Enum.filter(links, fn(x) -> x.from != name end)
      links = Enum.filter(links, fn(x) -> x.to != name end)
      nodes = Enum.filter(nodes, fn(x) -> x.name != name end)

      %{nodes: nodes, links: links}
    end)
  end

  def update_link(from, to, workload, distance) do
    Agent.update(__MODULE__, fn state ->
      %{nodes: nodes, links: links} = state

      links = Enum.filter(links, fn(x) -> !(x.from == from and x.to == to) end)
      links = Enum.filter(links, fn(x) -> !(x.from == to and x.to == from) end)
      links = links ++ [%{from: from, to: to, workload: workload, distance: distance}]    

      %{nodes: nodes, links: links}
    end)
  end

  def remove_link(from, to) do
    Agent.update(__MODULE__, fn state ->
      %{nodes: nodes, links: links} = state

      links = Enum.filter(links, fn(x) -> !(x.from == from and x.to == to) end)
      links = Enum.filter(links, fn(x) -> !(x.from == to and x.to == from) end)

      %{nodes: nodes, links: links}
    end)
  end

  def reset() do
    Agent.update(__MODULE__, fn _state ->
      initial_state()
    end)
  end

  def get() do
    Agent.get(__MODULE__, fn state -> state end)
  end

end  