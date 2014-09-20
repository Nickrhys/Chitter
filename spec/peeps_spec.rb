require 'spec_helper'

describe Peeps do
	
	context "demonstration of how datamapper works" do

		it 'should be created and then retrieved from the db' do
			expect(Peeps.count).to eq(0)
			Peeps.create(:peep => "Hello World!")
			expect(Peeps.count).to eq(1)
			peep = Peeps.first
			expect(peep.peep).to eq("Hello World!")
			peep.destroy
			expect(Peeps.count).to eq(0)
		end
		
	end

end