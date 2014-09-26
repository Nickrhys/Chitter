require 'bcrypt'
class User

	include DataMapper::Resource

	attr_reader :password

	property :id, Serial
	property :email, String
	property :password_digest, Text
	property :username, String
	property :name, String


	def password=(password)
		self.password_digest =BCrypt::Password.create(password)
	end	

end