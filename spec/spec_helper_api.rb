require 'spec_helper_db'

require 'support/test_dog_builder'

require 'rack/test'
include Rack::Test::Methods

require 'json_expressions/rspec'
JsonExpressions::Matcher.assume_strict_hashes = false

require 'app'
def app
  PuppyLove::App
end
