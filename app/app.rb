ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
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
    link = Link.new(url: params[:url],               # 1. Create a link
                  title: params[:title])
    tag  = Tag.first_or_create(name: params[:tags])  # 2. Create a tag for the link
    link.tags << tag                                 # 3. Adding the tag to the link's DataMapper collection.
    link.save                                        # 4. Saving the link.
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

end
