require 'dotenv'

APP_ENV = ENV.fetch("RACK_ENV")

Dotenv.load(
  File.expand_path("../../.#{APP_ENV}.env", __FILE__),
  File.expand_path("../../.env",  __FILE__)
)
