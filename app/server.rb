require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'models/peeps'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers/application'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

enable :sessions
set :session_supersecret, 'my unique encription key!'
use Rack::Flash
use Rack::MethodOverride
set :partial_template_engine, :erb

set :public_folder, Proc.new { File.join(root, "..", "public") }




