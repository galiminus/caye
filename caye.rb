require 'sinatra/base'
require 'sinatra/json'

require 'slim'

require 'faye'

require 'nest'

module Rack
  class Lint
    def call(env = nil)
      @app.call(env)
    end
  end
end

class Caye < Sinatra::Base
  helpers Sinatra::JSON

  before do
    headers['Access-Control-Allow-Methods'] = 'GET, POST'
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
  end

  get "/users/:me/messages/:to" do
    json Message.all(params[:me], params[:to])
  end

  get "/users" do
    json User.all
  end
end

