require 'sequel'

Sequel.default_timezone = :utc

environment = ENV.fetch('RACK_ENV')

DB ||= Sequel.connect(
  ENV["DATABASE_URL"] ||
    "postgres://localhost:5432/puppy_love_#{environment}"
)
