require 'sidekiq'
require 'open-uri'

require 'mappers/dog_mapper'
require 'services/dog_listings_scraper'
require 'services/dog_photo_importer'

class ImportDogListingJob
  include Sidekiq::Worker

  def self.enqueue(listing)
    perform_async(listing.id)
  end

  def initialize
    @mapper = DogMapper.new(DB)
    @dog_photo_importer = DogPhotoImporter.new
  end

  def perform(listing_id)
    logger.info "Importing Listing ##{listing_id}."

    listing = DogListingsScraper::Listing.new(listing_id)

    dog = listing.dog

    dog.photos = @dog_photo_importer.import(open(listing.photo_url))

    @mapper.insert(dog)

    logger.info "Listing ##{listing_id} imported."
  end
end
