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
    end

    it "infers the controller path" do
      expect(controller.request.path_parameters["action"]).to eql "index"
    end
  end
end
