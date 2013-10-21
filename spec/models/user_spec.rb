require 'spec_helper'

describe User do
	it "requires an email address to be present" do
		user = FactoryGirl.build :user, email: nil
		expect(user).not_to be_valid
	end  
end
