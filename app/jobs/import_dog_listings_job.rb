require 'sidekiq'

require 'services/dog_listings_scraper'
require 'jobs/import_dog_listing_job'

class ImportDogListingsJob
  include Sidekiq::Worker

  def initialize(options={})
    @scraper = options.fetch(:scraper) { DogListingsScraper.new }
  end

  def perform
    @scraper.each do |listing|
      ImportDogListingJob.enqueue(listing)
    end
  end
end
