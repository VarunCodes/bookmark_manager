require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text #stores hash and salt

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
