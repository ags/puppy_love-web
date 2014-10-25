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

  describe "retrieving dogs" do
    it "loads associated DogPhotos" do
      dog_a = a_dog.with_n_photos(2).persist
      dog_b = a_dog.persist
      dog_c = a_dog.with_n_photos(2).persist

      mapper = DogMapper.new(DB)
      dogs = mapper.all.sort_by(&:id)

      expect(dogs.size).to eq(3)
      expect(dogs[0].attributes).to eq(dog_a.attributes)
      expect(dogs[1].attributes).to eq(dog_b.attributes)
      expect(dogs[2].attributes).to eq(dog_c.attributes)
    end
  end
end
