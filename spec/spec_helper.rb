$LOAD_PATH << File.expand_path('../../', __FILE__)
$LOAD_PATH << File.expand_path('../../app', __FILE__)

ENV["RACK_ENV"] = "test"

require 'config/environment'
