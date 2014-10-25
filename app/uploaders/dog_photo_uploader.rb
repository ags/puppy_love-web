require 'carrierwave'
require 'securerandom'

class DogPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/dog/photos"
  end

  def filename
    "#{random_token}.jpg"
  end

  process convert: "jpg"

  version :thumb do
    process resize_to_fill: [200, 200]
  end

  private

  def random_token
    SecureRandom.uuid
  end
end
