require 'spec_helper'

describe EventsController do
  describe "GET 'show'" do
    # it "shows the winner of an event" do
    #   team = FactoryGirl.create :team, name: "bengals"
    #   event = FactoryGirl.create :event, winner: team 
    #   get :show
    #   expect(response.body).to eq team
    # end
    context "displays the #winner of an event" do
      it "shows a #home_team as the winner" do
        home_team = FactoryGirl.create :team, name: "chicken wing kings"
        event = FactoryGirl.create :event
        event.winner = home_team.name
        get :show
        expect(response).to eq home_team.name
      end
    end
  end
end
