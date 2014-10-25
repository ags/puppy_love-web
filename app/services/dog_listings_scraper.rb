require 'pet_rescue/scraper'
require 'models/dog'

# Enumerable collection of remote Listings.
class DogListingsScraper
  include Enumerable

  def initialize
    @dog_listings = PetRescue::Scraper::DogListings.new
  end

  def each(&block)
    @dog_listings.each do |listing_page|
      yield Listing.new(listing_page.id)
    end
  end

  # Represents a Listing with details of a Dog.
  class Listing
    attr_reader :id

    def initialize(id)
      @id = id
      @page = PetRescue::ListingPage.for_listing(id)
    end

    def dog
      Dog.new(name: pet.name,
              breed: pet.breed,
              size: pet.size,
              gender: pet.gender,
              age: pet.age,
              location: pet.location,
              vaccinated: pet.vaccinated,
              desexed: pet.desexed,
              rescued: pet.rescued)
    end

    def photo_url
      pet.large_photo_url
    end

    private

    def pet
      @_pet ||= @page.pet
    end
  end
end
