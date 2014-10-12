require 'spec_helper_api'

describe "GET /api/dogs" do
  it "returns a list of dogs" do
    a_dog.with_name("Lucy").persist
    a_dog.with_name("Pepper").persist

    get "/api/dogs"

    expect(last_response.status).to eq(200)
    expect(last_response.body).to match_json_expression(
      total: 2,
      _embedded: {
        dogs: [
          {name: "Lucy"},
          {name: "Pepper"}
        ]
      }
    )
  end
end
