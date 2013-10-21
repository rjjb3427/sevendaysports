require 'spec_helper'

describe University do
  it "requires presence of #name" do
    school = FactoryGirl.build :university, name: nil
    expect(school).not_to be_valid
    school.name = "Chatt State"
    expect(school.name).to be_present
  end

  it "requires presence of #address" do
  	school = FactoryGirl.build :university, address: nil
  	expect(school).not_to be_valid
  	school.address = "5859 Lee hwy."
  	expect(school.address).to be_present
  end

  it "requres presence of #city" do
  	school = FactoryGirl.build :university, city: nil
  	expect(school).not_to be_valid
  	school.city = "Chattanooga"
  	expect(school.city).to be_present
  end

  it "requires presence of #state" do
  	school = FactoryGirl.build :university, state: nil
  	expect(school).not_to be_valid
  	school.state = "TN"
  	expect(school.state).to be_present
  end

  it "requires presence of #zip" do
  	school = FactoryGirl.build :university, zip: nil
  	expect(school).not_to be_valid
  	school.zip = "12345"
  	expect(school.zip).to be_present
  	expect(school).to be_valid
  end

  it "requires presence of #url" do
  	school = FactoryGirl.build :university, url: nil
  	expect(school).not_to be_valid
  	school.url = "http://www.chattanoogastate.edu"
  	expect(school.url).to be_present
  end
end
