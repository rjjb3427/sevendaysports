require 'spec_helper'

describe "the signup process", type: :feature do
  before :each do
    User.make(email: 'user1@example.com', password: '123456')
  end

  it "creates a new #user" do
    visit "/users/new"

    fill_in "Email", with: "User email"
    click_button "Create User"

    expect(page).to have_text("User was successfully created.")
  end
end
