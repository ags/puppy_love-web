require 'spec_helper'
require 'jobs/import_dog_listings_job'

describe ImportDogListingsJob do
  it "enqueues an ImportDogListingJob for each Dog listing" do
    scraper = instance_double("DogListingsScraper")
    listing_a = instance_double(DogListingsScraper::Listing)
    listing_b = instance_double(DogListingsScraper::Listing)

    allow(DogListingsScraper).to receive(:new).and_return(scraper)
    allow(scraper).to receive(:each)
      .and_yield(listing_a)
      .and_yield(listing_b)

    expect(ImportDogListingJob).to receive(:enqueue).with(listing_a)
    expect(ImportDogListingJob).to receive(:enqueue).with(listing_b)

    ImportDogListingsJob.new.perform
  end
end
