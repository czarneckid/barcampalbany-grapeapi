$LOAD_PATH << '.'

require 'rack'
require 'voting/api'
require 'voting/initializers/redis'

run Rack::Cascade.new([
  Voting::API
])
