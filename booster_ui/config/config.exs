# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :booster_ui,
  ecto_repos: [BoosterUi.Repo]

# Configures the endpoint
config :booster_ui, BoosterUiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6nfq0tq5aFmldv9jmxSy4VmGGodapVLX5VEhrRAOm2xU5ZvCNOVJU2W9xz8sjH1o",
  render_errors: [view: BoosterUiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BoosterUi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
