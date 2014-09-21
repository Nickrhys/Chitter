require 'spec_helper'

feature "User sees peeps" do
	
	before(:each) {
		Peeps.create(:peep => "Hello World!")
			}

	scenario "when opening the homepage" do
		visit'/'
		expect(page).to have_content("Hello World!")
	end
end
