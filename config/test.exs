import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :stonecast, StonecastWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "miVfOCN4LUSzFPym8MbEqXWoK53vvq26G3XI4lRXV2a7A+j/hdlaPYSWxUTgGvDQ",
  server: false

# In test we don't send emails.
config :stonecast, Stonecast.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
