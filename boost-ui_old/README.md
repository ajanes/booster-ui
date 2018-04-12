# booster-ui

booster-ui is a visualization based on [d3](https://d3js.org/), which visualizes how booster connects to nodes and endpoints. For more about Booster, see [here](https://github.com/danielmorandini/booster-network).

d3 is used under the [BSD 3-Clause "New" or "Revised"](https://github.com/d3/d3/blob/master/LICENSE) License.

Icons made by [Freepik](http://www.freepik.com) from [Flaticon](https://www.flaticon.com/), licensed by [Creative Commons BY 3.0](http://creativecommons.org/licenses/by/3.0/).

To run booster-ui:

  * Install [the Phoenix Framework](http://phoenixframework.org/)
  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Here are some examples of commands you can use to visualize nodes on the graph:

  * http://localhost:4000/api/reset
  * http://localhost:4000/api/addnode?name=Client&group=1
  * http://localhost:4000/api/addnode?name=Proxy_1&group=2&parent=Client&distance=15&workload=1
  * http://localhost:4000/api/addnode?name=Web&group=3&parent=Proxy_1&distance=10&workload=1
  * http://localhost:4000/api/updatelink?from=Client&to=Proxy_1&distance=10&workload=3
  * http://localhost:4000/api/updatelink?from=Proxy_1&to=Web&distance=10&workload=3
  * http://localhost:4000/api/addnode?name=Proxy_2&group=2
  * http://localhost:4000/api/addlink?from=Proxy_1&to=Proxy_2&distance=10&workload=1
  * http://localhost:4000/api/addlink?from=Proxy_2&to=Web&distance=10&workload=1
  * http://localhost:4000/api/updatelink?from=Client&to=Proxy_1&distance=10&workload=5
