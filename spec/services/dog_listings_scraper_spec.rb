require 'spec_helper'
require 'support/vcr'
require 'services/dog_listings_scraper'

describe DogListingsScraper do
  it "is an enumerable collection of scraped listings" do
    VCR.use_cassette("scrape_listings") do
      scraper = DogListingsScraper.new

      listing_ids = scraper.take(3).map(&:id)

      expect(listing_ids.size).to eq(3)
    end
  end
end

describe DogListingsScraper::Listing do
  it "allows creation of a Dog" do
    VCR.use_cassette("get_listing_316126") do
      listing = DogListingsScraper::Listing.new(316126)

      dog = listing.dog

      expect(dog.name).to eq("Harley")
      expect(dog.breed).to eq("German Spitz Mix")
    end
  end
end
