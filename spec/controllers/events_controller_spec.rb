require 'spec_helper'

describe EventsController do
  describe "GET 'show'" do
    xit "shows the winner of an event" do
      team = FactoryGirl.create :team, name: "bengals"
      event = FactoryGirl.create :event, winner: team 
      get :show
      expect(response.body).to include "bengals win"
    end
  end
end
