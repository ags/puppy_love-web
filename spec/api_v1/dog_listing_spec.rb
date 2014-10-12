require 'spec_helper'
require 'support/test_dog_builder'

require 'rack/test'
include Rack::Test::Methods

require 'app'
def app
  PuppyLove::App
end

describe "GET /api/dogs" do
  it "returns a list of dogs" do
    a_dog
      .with_name("Lucy")
      .of_breed("Dachshund")
      .persist

    get "/api/dogs"

    expect(last_response.status).to eq(200)

    body = JSON.parse(last_response.body)
    dogs = body["_embedded"]["dogs"]
    expect(dogs.first["name"]).to eq("Lucy")
  end
end
