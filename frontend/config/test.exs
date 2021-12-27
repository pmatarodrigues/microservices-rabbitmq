import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :frontend, FrontendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "JZaEaR0y7seICKi0xAgiHFjJ5fCoufs4i5cEcK9u5JjKLgO2ggyUggk/93A+RqBx",
  server: false

# In test we don't send emails.
config :frontend, Frontend.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
