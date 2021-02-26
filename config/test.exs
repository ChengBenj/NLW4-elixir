use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rocketpay, RocketpayWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :rocketpay, Rocketpay.Repo,
  username: "root",
  password: "ava123456",
  database: "rocketpay_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
