# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :visualizer, VisualizerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bSr1dU96+aWKr5SPNzMCq3CiUNYB85fTea4QTO+r2/ibj4fQA0e1Z27hvI6GSQi1",
  render_errors: [view: VisualizerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Visualizer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
