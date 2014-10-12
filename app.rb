$LOAD_PATH << File.expand_path('..', __FILE__)
$LOAD_PATH << File.expand_path('../app', __FILE__)

require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/json'

require 'config/db'

require 'models/dog'
require 'serializers/dogs_serializer'

module PuppyLove
  class App < Sinatra::Base
    register Sinatra::Namespace

    set :database, DB

    namespace "/api" do
      get "/dogs" do
        pets = [
          Dog.new(id: 1, name: "Lucy", breed: "Dachshund"),
          Dog.new(id: 2, name: "Pepper", breed: "Schnauzer"),
        ]

        json DogsSerializer.new(pets).to_hash
      end

      get "/dogs/:id" do
        raise NotImplementedError
      end
    end
  end
end
