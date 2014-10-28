post '/peeps' do
  Peeps.with(params['peep'], current_user)
  redirect to ('/')
end