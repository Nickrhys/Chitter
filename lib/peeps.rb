# This class will correspond to a table in the database
class Peeps


	include DataMapper::Resource

	property :id, 			Serial
	property :peep, 		String
	# property :username, 	String
	# property :userhandle, 	String

end