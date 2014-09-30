require 'sinatra'
require 'data_mapper'
require 'rack-flash'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/peeps'
require './lib/user'
require_relative 'application'

enable :sessions
set :session_supersecret, 'my unique encription key!'
use Rack::Flash
use Rack::MethodOverride

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
	@user = User.new
	erb :"users/new"
end

post '/users' do 
	@user = User.new(:email => params[:email],
				:password => params[:password], 
				:password_confirmation => params[:password_confirmation],
				:username => params[:username],
				:name => params[:name])
	if @user.save
		session[:user_id] = @user.id
		redirect to('/')
	else
		flash[:notice] = "Sorry, your passwords don't match"
		erb :"users/new"
	end
end

get '/sessions/new' do 
	erb :"sessions/new"
end

post'/sessions' do
	email, password = params[:email], params[:password]
	user = User.authenticate(email, password)
	if user
		session[:user_id] = user.id 
		redirect to('/')
	else
		flash[:errors] = ["The email or password is incorrect"]
		erb :"sessions/new"
	end
end

delete '/sessions' do 
	flash[:notice] = "Good bye!"
	session[:user_id] = nil
	redirect to ('/')
end