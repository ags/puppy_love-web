require 'models/dog_photo'

# Maps DogPhoto models to and from a database.
class DogPhotoMapper
  def initialize(database)
    @database = database
  end

  def insert(dog, dog_photo)
    now = Time.now

    dataset.insert(dog_id: dog.id,
                   path: dog_photo.path,
                   version_name: dog_photo.version_name,
                   created_at: now,
                   updated_at: now)

    dog_photo
  end

  private

  def dataset
    @database[:dog_photos]
  end
end
