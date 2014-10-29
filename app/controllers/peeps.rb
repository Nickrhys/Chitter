post '/peeps' do
  Peeps.with(params['peep'], current_user)
  redirect to ('/')
end

get '/peeps/new' do
  erb :"peeps/new"
end