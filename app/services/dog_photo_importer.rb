require 'open-uri'

require 'mappers/dog_photo_mapper'
require 'models/dog_photo'
require 'uploaders/dog_photo_uploader'

# TODO Imports a photo from a URL for a Dog.
class DogPhotoImporter
  def initialize(dog, url)
    @dog = dog
    @url = url
  end

  def import
    mapper = DogPhotoMapper.new(DB)
    uploader = DogPhotoUploader.new(@dog)

    uploader.store!(open(@url))

    uploader.versions.each do |name, version|
      photo = DogPhoto.new(
        dog: @dog,
        url: version.url,
        version_name: name
      )

      mapper.insert(photo)
    end
  end
end
