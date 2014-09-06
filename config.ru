require 'faye'
require File.expand_path('../caye', __FILE__)

Dir["#{File.expand_path('../lib', __FILE__)}/**/*.rb"].each do |file|
  require file
end

use Faye::RackAdapter, :mount      => '/faye',
                       :timeout    => 25,
                       :extensions => [StoreUsers.new, StoreMessages.new]
run Caye
