require 'spec_helper'

describe "static_pages/home.html.erb" do
  context "when user not authenticated" do
    it "displays the sign_in link" do
      render 
      expect(rendered).to have_selector()
      # expect(controller.request.path_parameters["action"]).to eql "home"

    end
  end
end
