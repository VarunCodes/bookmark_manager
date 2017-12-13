ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper'
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

  get '/links/new' do
    erb :new_bookmark
  end

  post '/links' do
    p params
    Link.create(:title => params[:title], :url => params[:url] )
    redirect '/links'
  end

end
