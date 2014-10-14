require 'spec_helper'
require 'jobs/import_dog_listing_job'

describe ImportDogListingJob do
  it "persists the Dog from the given listing" do
    mapper = spy(:mapper)
    dog = double(:dog)
    listing = instance_double("DogListingsScraper::Listing")
    job = ImportDogListingJob.new(mapper: mapper)

    allow(DogListingsScraper::Listing).to receive(:new).with(123).and_return(listing)

    allow(listing).to receive(:dog).and_return(dog)

    job.perform(123)

    expect(mapper).to have_received(:insert).with(dog)
  end
end
