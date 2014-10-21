require 'spec_helper_db'
require 'support/test_dog_builder'
require 'services/dog_photo_importer'

describe DogPhotoImporter do
  it do
    # TODO fake s3?
    dog = a_dog.persist
    url = "http://cdn.petrescue.com.au/uploads/pet_photos/2014/10/1/321180_d3b77_340x340_e9b1d.jpg"

    DogPhotoImporter.new(dog, url)

    require 'pp'
    pp DogPhotoMapper.all
  end
end
