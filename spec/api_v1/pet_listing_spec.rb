require 'spec_helper'

require 'rack/test'
include Rack::Test::Methods

require 'app'
def app
  PuppyLove::App
end

describe "GET /api/pets" do
  it "returns a list of pets" do
    get "/api/pets"

    expect(last_response.status).to eq(200)

    body = JSON.parse(last_response.body)
    pets = body["_embedded"]["pets"]
    expect(pets.first["name"]).to eq("Lucy")
  end
end
