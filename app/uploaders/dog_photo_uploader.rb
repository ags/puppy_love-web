require 'carrierwave'
require 'securerandom'

# Processes and stores a photo using the confguired storage mechanism.
class DogPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/dog/photos"
  end

  def filename
    "#{random_token}.jpg"
  end

  process convert: "jpg"

  version :app do
    process resize_to_fill: [600, 0]
  end

  private

  def random_token
    SecureRandom.uuid
  end
end
