require 'sinatra/base'
require_relative './models/link.rb'

class Bookmark < Sinatra::Base

  get '/' do
    "Hello"
  end

  get '/links' do
   @links = Link.all
   erb(:links)
  end

end
