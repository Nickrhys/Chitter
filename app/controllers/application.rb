get'/' do
  @peeps = Peeps.all
  @session = session[:user_id]
  erb :index
end
