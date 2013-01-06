require 'bundler/setup'
require 'sinatra/base'
require 'json'
require 'omniauth-everyplay'

class App < Sinatra::Base
  get '/' do
    redirect '/auth/everyplay'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env['omniauth.auth'])
  end
  
  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env['omniauth.auth'])
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :everyplay, ENV['EVERYPLAY_CLIENT_ID'], ENV['EVERYPLAY_SECRET'], :scope => 'basic'
end

run App.new
