require 'sinatra/base'
require_relative './app/models/link.rb'

class Bookmark < Sinatra::Base

  get '/' do
    "Hello"
  end

  # get '/links' do
  #   p Link.all
  # end

end
