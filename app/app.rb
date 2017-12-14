ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require 'sinatra/base'
require_relative './models/link.rb'

class Bookmark < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    "Hello"
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/links' do
   @links = Link.all
   erb(:links)
  end

  get '/links/new' do
    erb :new_bookmark
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end
end
