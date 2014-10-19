require 'sequel'
require 'logger'

Sequel.default_timezone = :utc

DB ||= Sequel.connect(ENV.fetch("DATABASE_URL"))

DB.loggers << Logger.new(STDOUT)
