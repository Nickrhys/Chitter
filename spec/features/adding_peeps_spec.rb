require 'spec_helper'

feature "user adds a new peep" do 
	
	scenario "when browsing the homepage" do 
		

		User.create(:email =>  "test@test.com",
					:password => 'test',
					:password_confirmation => 'test',
					:username => 'AliceR',
					:name => 'AliceR')
		sign_in("test@test.com", "test")
		expect(Peeps.count).to eq (0)
		visit '/'
		add_peep("Hello World!")
		expect(Peeps.count).to eq(1)
		peep = Peeps.first
		expect(peep.peep).to eq("Hello World!")
	end

	def add_peep(peep)
		within('#new-peep') do
			fill_in 'peep', with: peep
			click_button 'add peep'
		end
	end
end	