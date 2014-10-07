require 'spec_helper'

feature "User sees peeps" do
	
	before(:each) {user = User.create(:email =>  "test@test.com",
					:password => 'test',
					:password_confirmation => 'test',
					:username => 'AliceR',
					:name => 'AliceR')
		Peeps.create(:peep => "Hello World!", user: user)
			}

	scenario "when opening the homepage" do
		visit'/'
		expect(page).to have_content("Hello World! - AliceR")
	end
end
