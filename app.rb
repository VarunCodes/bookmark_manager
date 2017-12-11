require 'sinatra/base'

class Bookmark < Sinatra::Base
  get '/' do 
    "Hello"
  end
end
