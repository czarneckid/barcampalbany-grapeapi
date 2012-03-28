require 'redis'

redis_configuration = YAML.load_file("#{File.dirname(__FILE__)}/config/redis.yml")[ENV['RACK_ENV'] || 'development']
$redis = Redis.new(
  :host => redis_configuration[:host], 
  :port => redis_configuration[:port], 
  :password => redis_configuration[:password],
  :db => redis_configuration[:database]
)
