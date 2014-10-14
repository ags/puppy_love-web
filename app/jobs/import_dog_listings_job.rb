require 'sidekiq'

require 'services/dog_listings_scraper'
require 'jobs/import_dog_listing_job'

class ImportDogListingsJob
  include Sidekiq::Worker

  def perform
    scraper = DogListingsScraper.new
    scraper.each do |listing|
      ImportDogListingJob.enqueue(listing)
    end
  end
end
