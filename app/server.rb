require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require_relative 'models/peeps'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers/application.rb'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

enable :sessions
set :session_supersecret, 'my unique encription key!'
use Rack::Flash
use Rack::MethodOverride




