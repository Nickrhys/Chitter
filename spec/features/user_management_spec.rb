require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers 

feature "user signs up" do
	
	scenario "when being logged out" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, Alice")
		expect(User.first.email).to eq("alice@example.com")
	end
end

	#scenario "with a password thats "

feature "User signs in" do

	before do
		user = User.create(:email => "test@test.com", 
					:password => 'test',
					:password_confirmation => 'test',
					:username => 'AliceR',
					:name => 'AliceR')
	end

	scenario "with correct credentials" do
		visit'/'
		expect(page).not_to have_content("Welcome, AliceR")
		sign_in('test@test.com', 'test')
		expect(page).to have_content("Welcome, AliceR")
	end

end

feature 'User signs out' do 

	before do 
		User.create(:email =>  "test@test.com",
					:password => 'test',
					:password_confirmation => 'test',
					:username => 'AliceR',
					:name => 'AliceR')
	end

	scenario 'while being signed in' do 
		sign_in('test@test.com', 'test')
		click_button 'Sign Out'
		expect(page).to have_content("Good bye!")
		expect(page).not_to have_content("Welcome, AliceR")
	end

end