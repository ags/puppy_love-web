$LOAD_PATH << File.expand_path('..', __FILE__)
$LOAD_PATH << File.expand_path('../app', __FILE__)

require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/json'

require 'config/environment'
require 'config/db'
require 'config/carrierwave'

require 'serializers/dogs_serializer'

# these are required upfront for sidekiq - change this?
require 'jobs/import_dog_listings_job'
require 'jobs/import_dog_listing_job'

module PuppyLove
  class App < Sinatra::Base
    register Sinatra::Namespace

    set :json_content_type, "application/hal+json"

    namespace "/api" do
      get "/dogs" do
        dogs = DogMapper.new(DB).all

        json DogsSerializer.new(dogs).to_hash
      end

      get "/dogs/:id" do
        raise NotImplementedError
      end
    end
  end
end
