$LOAD_PATH << File.expand_path('..', __FILE__)
$LOAD_PATH << File.expand_path('../app', __FILE__)

require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/json'

require 'config/db'
require 'config/registry'

require 'serializers/dogs_serializer'

module PuppyLove
  class App < Sinatra::Base
    register Sinatra::Namespace

    set :json_content_type, "application/hal+json"

    namespace "/api" do
      get "/dogs" do
        dogs = PuppyLove.dog_mapper.all

        json DogsSerializer.new(dogs).to_hash
      end

      get "/dogs/:id" do
        raise NotImplementedError
      end
    end
  end
end
