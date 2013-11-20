require 'spec_helper'

describe "users/index.html.erb" do
  it "displays all #users" do
  end

  context "when more than one user" do
    it "displays more than one user" do

    end
  end

  context "when rendering the user template" do
    it "displays the user" do
    	user = FactoryGirl.create :user, email: "user@example.com"
    	render 
    	expect(rendered).to contain("#{@user.email}")
    end

    it "infers the controller path" do
      expect(controller.request.path_parameters["action"]).to eql "index"
    end
  end

  context "when displaying all #users" do
  	it "displays the matching #email" do
  		user = FactoryGirl.create :user, email: "user@example.com"
  		render
  		expect(rendered).to contain("user@example.com")
  	end
  	
  	it "does not display a different #email" do
  		user = FactoryGirl.create :user, email: "user@example.com"
  		render
  		expect(rendered).not_to contain("another_user@example.com")
  	end
  end
end
