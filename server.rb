require 'sinatra'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/peeps'
require './lib/user'
require_relative 'application'

enable :sessions
set :session_supersecret, 'my unique encription key!'

DataMapper.finalize

DataMapper.auto_upgrade! 

get'/' do
	@peeps = Peeps.all
	erb :index
end

post '/peeps' do
	peep = params["peep"]
	Peeps.create(:peep => peep)
	redirect to ('/')
end

get '/users/new' do
	erb :"users/new"
end

post '/users' do 
	User.create(:email => params[:email],
				:password => params[:password], 
				:username => params[:username],
				:name => params[:name])
	redirect to('/')
end