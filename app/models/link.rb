require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Link
  attr_reader :id, :title, :url

  include DataMapper::Resource

  property :id,    Serial
  property :title, String
  property :url,   String
end

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
