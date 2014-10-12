$LOAD_PATH << File.expand_path('../app', __FILE__)

require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/json'

require 'config/db'

require 'models/pet'
require 'serializers/pets_serializer'

module PuppyLove
  class App < Sinatra::Base
    register Sinatra::Namespace

    namespace "/api" do
      get "/pets" do
        pets = [
          Pet.new(id: 1, name: "Lucy", breed: "Dachshund"),
          Pet.new(id: 2, name: "Pepper", breed: "Schnauzer"),
        ]

        json PetsSerializer.new(pets).to_hash
      end

      get "/pets/:id" do
        raise NotImplementedError
      end
    end
  end
end
