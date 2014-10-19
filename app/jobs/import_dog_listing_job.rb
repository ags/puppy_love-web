require 'sidekiq'

require 'mappers/dog_mapper'
require 'services/dog_listings_scraper'

class ImportDogListingJob
  include Sidekiq::Worker

  def self.enqueue(listing)
    perform_async(listing.id)
  end

  def initialize(options={})
    @mapper = options.fetch(:mapper) { DogMapper.new(DB) }
  end

  def perform(listing_id)
    logger.info "Importing Listing ##{listing_id}."

    listing = DogListingsScraper::Listing.new(listing_id)

    @mapper.insert(listing.dog)

    logger.info "Listing ##{listing_id} imported."
  end
end
