require 'models/dog'
require 'mappers/dog_photo_mapper'

# Maps Dog models to and from a database.
class DogMapper
  def initialize(database)
    @database = database
  end

  def insert(dog)
    now = Time.now

    @database.transaction do
      dog.id = dataset.insert(name: dog.name,
                              breed: dog.breed,
                              age: dog.age,
                              size: dog.size,
                              gender: dog.gender,
                              location: dog.location,
                              vaccinated: dog.vaccinated?,
                              desexed: dog.desexed?,
                              rescued: dog.rescued?,
                              created_at: now,
                              updated_at: now)

      dog.photos.each do |photo|
        photo_mapper.insert(dog, photo)
      end
    end

    dog
  end

  def find_by_id(id)
    row = dataset[id: id]
    Dog.new(row)
  end

  def all
    dogs = {}

    rows = dataset.graph(:dog_photos, dog_id: :id)

    rows.each do |row|
      dog = dogs[row[:id]] ||= Dog.new(row)
      if row[:dog_photos_id]
        dog.photos << DogPhoto.new(path: row[:path],
                                   version_name: row[:version_name])
      end
    end

    dogs.values
  end

  private

  def dataset
    @database[:dogs]
  end

  def photo_mapper
    @photo_mapper ||= DogPhotoMapper.new(DB)
  end
end
