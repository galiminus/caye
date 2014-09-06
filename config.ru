require 'faye'
require 'redis'
require 'active_support/all'

require File.expand_path('../caye', __FILE__)
Dir["#{File.dirname( __FILE__)}/lib/**/*.rb"].each do |file|
  require file
end

$redis = Nest.new("caye", Redis.new(url: ENV["REDISCLOUD_URL"]))

use Faye::RackAdapter, :mount      => '/faye',
                       :timeout    => 25,
                       :extensions => [StoreUsers.new, StoreMessages.new]
run Caye
