require 'sidekiq'

require 'mappers/dog_mapper'
require 'services/dog_listings_scraper'
require 'services/dog_photo_importer'

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
    dog = listing.dog

    dog = @mapper.insert(dog)

    DogPhotoImporter.new(dog, listing.large_photo_url).import

    # importing a listing
    #   get dog -> insert
    #   get dog photo -> upload, insert
    #   mark listing as imported

    # re-importing a listing
    #   get dog -> update
    #   get dog photo -> update
    #   mark listing as imported

    logger.info "Listing ##{listing_id} imported."
  end
end
