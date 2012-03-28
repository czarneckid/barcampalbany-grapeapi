$LOAD_PATH << '.'

ENV['RACK_ENV'] ||= 'test'

require 'rack/test'
require 'rspec'
require 'voting/api'
require 'voting/initializers/redis'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:each) do
    $redis.flushdb
  end
end