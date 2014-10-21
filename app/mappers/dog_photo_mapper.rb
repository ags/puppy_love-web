require 'models/dog_photo'

# Maps DogPhoto models to and from a database.
class DogPhotoMapper
  def initialize(database)
    @database = database
  end

  def insert(dog_photo)
    now = Time.now

    dog_photo.id = dataset.insert(dog_id: dog_photo.dog.id,
                                  url: dog_photo.url,
                                  version_name: dog_photo.version_name,
                                  created_at: now,
                                  updated_at: now)

    dog_photo
  end

  def find_by_id(id)
    row = dataset[id: id]
    DogPhoto.new(row)
  end

  def all
    rows = dataset.all
    rows.map { |row| DogPhoto.new(row) }
  end

  private

  def dataset
    @database[:dog_photos]
  end
end
