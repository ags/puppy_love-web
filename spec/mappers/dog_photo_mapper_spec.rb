require 'spec_helper_db'
require 'support/test_dog_builder'
require 'mappers/dog_photo_mapper'

describe DogPhotoMapper do
  describe "inserting a dog photo" do
    it "persists the dog photo details" do
      dog = a_dog.persist
      dog_photo = DogPhoto.new(dog: dog,
                               url: "http://example.com/foo.png",
                               version_name: "best")
      mapper = DogPhotoMapper.new(DB)

      mapper.insert(dog_photo)

      expect(dog_photo.id).not_to be_nil
      persisted_dog_photo = mapper.find_by_id(dog_photo.id)
      expect(dog_photo.attributes).to eq(persisted_dog_photo.attributes)
    end
  end
end
