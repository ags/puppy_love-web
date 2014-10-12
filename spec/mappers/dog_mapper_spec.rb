require 'spec_helper_db'
require 'support/test_dog_builder'
require 'mappers/dog_mapper'

describe DogMapper do
  describe "inserting a dog" do
    it "persists the dog details" do
      dog = a_dog.build
      mapper = DogMapper.new(DB)

      mapper.insert(dog)

      expect(dog.id).not_to be_nil
      persisted_dog = mapper.find_by_id(dog.id)
      expect(dog.attributes).to eq(persisted_dog.attributes)
    end
  end
end
