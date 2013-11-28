require 'spec_helper'

describe 'User' do
	let(:user) { FactoryGirl.create(:user) }

	it 'requires the presence of #email' do
		expect(user.email).to eq 'test@example.com'
	end

	it 'requires presence of #first_name & #last_name' do
		expect(user).to be_valid
		user.first_name = 'bob'
		user.last_name = 'hope'
		expect(user.first_name).to eq 'bob'
		expect(user.last_name).to eq 'hope'
	end

	it 'has a #full_name' do 
		user.first_name = 'bob'
		user.last_name = 'hope'
		expect(user.full_name).to eq 'bob hope'
	end
	
	it 'requires #password to be present & a minumum of 6 characters' do
		expect(user.password).to eq '12345678'
		expect(user.password.length).not_to eq '12345'
	end

	it 'requires #password be > 5 & < then 128 characters' do 
		expect(user).to be_valid
		user.password_confirmation = '12345678'
		expect(user.password_confirmation.length).not_to be < 5 
		expect(user.password_confirmation.length).not_to be > 128
	end

	it 'requires presence of #dob' do
		user.dob 
		expect(user.dob).to eq Date.parse("2022-01-05")
	end

	it 'requires presence of #school_name' do
		user.school_name = 'mich state'
		expect(user.school_name).to eq 'mich state'
	end

	it 'has an #address' do
		expect(user.address).to eql '123 Test Ave.'
	end

	it 'has a #city' do
		expect(user.city).to eql 'Sample'
	end

	it 'has a #state' do 
		expect(user.state).to eql 'TS'
	end

	it 'has a #zip' do
		expect(user.zip).to eql '12345'
	end
end
