require 'models/dog'
require 'mappers/dog_mapper'

class TestDogBuilder
  def initialize(attributes={})
    @dog = Dog.new({
      name: "Tessa",
      breed: "Jack Rusell"
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
