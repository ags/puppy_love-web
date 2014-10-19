require 'spec_helper'
require 'jobs/import_dog_listings_job'

describe ImportDogListingsJob do
  it "enqueues an ImportDogListingJob for each Dog listing" do
    scraper = double(:scraper)
    listing_a = double(:listing)
    listing_b = double(:listing)

    allow(scraper).to receive(:each)
      .and_yield(listing_a)
      .and_yield(listing_b)

    expect(ImportDogListingJob).to receive(:enqueue).with(listing_a)
    expect(ImportDogListingJob).to receive(:enqueue).with(listing_b)

    job = ImportDogListingsJob.new(scraper: scraper)
    job.perform
  end
end
