# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pennystock_api,
  ecto_repos: [PennystockApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :pennystock_api, PennystockApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pDrzK5pdFPCXx7hRiUIvu3vAvRBByy4M82kWMXoed4iwCWgUd3yWCbYbpEtBHGqG",
  render_errors: [view: PennystockApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PennystockApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures Quantom for Cron Scheduling
config :pennystock_api, PennystockApi.Scheduler,
  jobs: [
    phoenix_job: [
      schedule: "*/1 * * * *",
      task: {PennystockApi.Task, :work, []}
    ]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
