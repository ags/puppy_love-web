require 'models/dog'

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
    }.merge(attributes))
  end

  def with_name(name)
    @dog.name = name
    self
  end

  def of_breed(breed)
    @dog.breed = breed
    self
  end

  def with_n_photos(n)
    require 'securerandom'
    n.times do
      id = SecureRandom.uuid
      @dog.photos << DogPhoto.new(path: "/#{id}.jpg",
                                  version_name: "v_#{id}")
    end
    self
  end

  def build
    @dog
  end

  def persist
    require 'mappers/dog_mapper'
    mapper = DogMapper.new(DB)
    mapper.insert(@dog)
  end
end

def a_dog
  TestDogBuilder.new
end
