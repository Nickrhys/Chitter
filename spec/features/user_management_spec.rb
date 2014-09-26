require 'spec_helper'

feature "user signs up" do
	
	scenario "when being logged out" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, AliceR")
		expect(User.first.email).to eq("alice@example.com")
	end
	
	def sign_up(email = "alice@example.com", password = "oranges!", username= "Alice", name= "AliceR")
		visit '/users/new'
		expect(page.status_code).to eq (200)
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :username, :with => username
		fill_in :name, :with => name
		click_button "Sign up"
	end

# feature "user signs in" do 
# 	before(:each)do
# 		User.create(:email => "test@test.com", 
# 	end
end