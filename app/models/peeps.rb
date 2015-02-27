# This class will correspond to a table in the database
class Peeps

	include DataMapper::Resource

	has 1, :user, :through => Resource

	property :id, 			Serial
	property :peep, 		String

	def self.with(peep, user)
		create(peep: peep, user: user)
	end
end
