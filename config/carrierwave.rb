require 'fog/aws/storage'
require 'carrierwave'

if APP_ENV == "test"
  CarrierWave.configure do |config|
    config.storage = :file
    config.root = File.expand_path('../../tmp', __FILE__)
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id:     ENV.fetch("AWS_ACCESS_KEY_ID"),
      aws_secret_access_key: ENV.fetch("AWS_SECRET_ACCESS_KEY"),
      region:                ENV.fetch("S3_REGION")
    }
    config.fog_directory = ENV.fetch("S3_BUCKET_NAME")
    config.asset_host = ENV.fetch("CDN_HOST")
  end
end
