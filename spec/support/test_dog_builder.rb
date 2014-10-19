require 'models/dog'
require 'mappers/dog_mapper'

class TestDogBuilder
  def initialize(attributes={})
    @dog = Dog.new({
      name: "Tessa",
      breed: "Jack Rusell",
      size: "Small",
      gender: "Female",
      age: "5 years 6 months",
      location: "Geelong",
      vaccinated: true,
      desexed: true,
      rescued: false,
      photo_url: "http://example.com/tessa.png",
    }.merge(attributes))

    @mapper = DogMapper.new(DB)
  end

  def with_name(name)
    @dog.name = name
    self
  end

  def of_breed(breed)
    @dog.breed = breed
    self
  end

  def build
    @dog
  end

  def persist
    @mapper.insert(@dog)
  end
end

def a_dog
  TestDogBuilder.new
end
