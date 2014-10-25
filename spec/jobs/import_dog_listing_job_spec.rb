require 'spec_helper_db'
require 'support/vcr'
require 'config/carrierwave'
require 'jobs/import_dog_listing_job'

describe ImportDogListingJob do
  it "imports a Dog and associated photos from a listing" do
    listing_id = 283247
    job = ImportDogListingJob.new

    VCR.use_cassette("importing_dog_listing_283247") do
      job.perform(listing_id)
    end

    dogs = DogMapper.new(DB).all
    expect(dogs.size).to eq(1)
    expect(dogs.first.photos.size).to eq(1)
  end
end
