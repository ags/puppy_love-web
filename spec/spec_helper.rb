$LOAD_PATH << File.expand_path('../../', __FILE__)
$LOAD_PATH << File.expand_path('../../app', __FILE__)

ENV["RACK_ENV"] = "test"

if ENV["COVERAGE"] == "true"
  require 'simplecov'

  SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
  ]

  SimpleCov.start
end

require 'config/environment'

RSpec.configure do |config|
  config.after(:suite) do
    # Clean up CarrierWave uploads.
    if defined?(CarrierWave)
      uploads_dir = "#{CarrierWave::Uploader::Base.root}/uploads"
      FileUtils.rm_rf(uploads_dir)
    end
  end
end
