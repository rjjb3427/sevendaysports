require 'spec_helper'

describe User do
	it { should validate_presence_of(:email) }

	it { should }
	it "requires a valid #email" do
		user = FactoryGirl.build :user, email: "bad email address"
		expect(user).not_to be_valid
		user.email = "test@example.com"
		expect(user).to be_valid
	end

	it "requires presence of #first_name" do
		user = FactoryGirl.build :user, first_name: nil
		expect(user).not_to be_valid
		user.first_name = "bob"
		expect(user).to be_present
	end

	it "requires presence of #last_name" do 
		user = FactoryGirl.build :user, last_name: nil
		expect(user).not_to be_valid
		user.last_name = "hope"
		expect(user.last_name).to be_present
	end

	it "has a #full_name" do 
		user = FactoryGirl.build :user, first_name: "bob", last_name: "hope"
		expect(user.full_name).to be_present
	end

	it "has a #full_name" do 
		user = FactoryGirl.build :user, first_name: "jane", last_name: "hope"
		expect(user.full_name).to be_present
	end

	it "requires #password to be present" do
		user = FactoryGirl.build :user, password: "12345678"
		expect(user.password).to be_present 
	end

	it "requires a valid #password" do
		user = FactoryGirl.build :user, password: nil
		expect(user).not_to be_valid
		user.password = "12345678"
		expect(user.password.length).to be > 7
		expect(user.password.length).to be < 129
	end

	it "requires a valid #password_confirmation" do 
		user = FactoryGirl.build :user, password_confirmation: nil
		expect(user).not_to be_valid
		user.password_confirmation = "12345678"
		expect(user.password_confirmation.length).to be > 7
		expect(user.password_confirmation.length).to be < 129
	end

	it "requires presence of #dob" do
		user = FactoryGirl.build :user, dob: nil
		expect(user).not_to be_valid
	end

	it "requires presence of #school_name" do
		user = FactoryGirl.build :user, school_name: nil
		expect(user).not_to be_valid
		user.school_name = "mich state"
		expect(user.school_name).to be_present
	end

	it "has an #address" do
		user = FactoryGirl.build :user, address: "123 Test Ave."
		expect(user.address).to eql "123 Test Ave."
	end

	it "has a #city" do
		user = FactoryGirl.build :user, city: "sample_city"
		expect(user.city).to eql "sample_city"
	end

	it "has a #state" do 
		user = FactoryGirl.build :user, state: "sample_state"
		expect(user.state).to eql "sample_state"
	end

	it "has a #zip" do
		user = FactoryGirl.build :user, zip: 12345
		expect(user.zip).to eql 12345
	end
end
