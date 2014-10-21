require 'carrierwave'

class DogPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/dogs/#{model.id}"
  end

  def filename
    "#{model.id}.jpg"
  end

  process convert: "jpg"

  version :thumb do
    process :resize_to_fill => [200, 200]
  end
end
