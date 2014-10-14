require 'sidekiq'

require 'services/dog_listings_scraper'
require 'mappers/dog_mapper'

class ImportDogListingJob
  include Sidekiq::Worker

  def self.enqueue(listing)
    perform_async(listing.id)
  end

  def initialize(options={})
    @mapper = options.fetch(:mapper) { PuppyLove.dog_mapper }
  end

  def perform(listing_id)
    listing = DogListingsScraper::Listing.new(listing_id)

    @mapper.insert(listing.dog)
  end
end
