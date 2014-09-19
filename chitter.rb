require 'sinatra'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/peeps'

DataMapper.finalize

DataMapper.auto_upgrade!

get'/' do
	'If this works you are taking a massive step'
end