require 'models/dog_photo'
require 'uploaders/dog_photo_uploader'

# Uploads a given photo of a Dog, returning a DogPhoto for each version.
class DogPhotoImporter
  def initialize(options={})
    @uploader = options.fetch(:uploader) { DogPhotoUploader.new }
  end

  def import(photo)
    @uploader.store!(photo)

    @uploader.versions.map do |name, version|
      DogPhoto.new(path: version.path, version_name: name)
    end
  end
end
