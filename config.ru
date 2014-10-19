require './app'
require 'sidekiq/web'

run Rack::URLMap.new(
  '/'        => PuppyLove::App,
  '/sidekiq' => Sidekiq::Web
)
