# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dSRrJXzEMBU411i0hlybizpguSOalrE+tXl1P1eqYgfqKlj0hbBIODmNuEeHJW9w",
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :guardian, Guardian,
  issuer: "Discuss",
  ttl: { 30, :days},
  allowed_drift: 2000,
  secret_key: {Discuss.MySecretKey, :fetch},
  serializer: Discuss.GuardianSerializer

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, []}
  ]

  config :ueberauth, Ueberauth.Strategy.Github.OAuth,
    client_id: "ad1eede3333fc7ff4f36",
    client_secret: "2130c3aa07001bb5604bd80f4e9bf232e7967e0c"
