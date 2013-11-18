require 'spec_helper'

describe EventsController do
  let(:team) {FactoryGirl.create(:team)}
  describe "GET :index" do
    it "returns http success" do
      get :index, team_id: team.id
      expect(response).to be_success
    end

    it "populates an array of all events" do
      event1 = FactoryGirl.create :event, home_team_id: team.id
      event2 = FactoryGirl.create :event, away_team_id: team.id
      get :index, team_id: team.id
      expect(assigns(:events)).to match_array([event1, event2])
    end
  end

  describe "GET :new" do
    it "returns http success" do
    end
  end

  describe "GET :show" do
    it "assigns the requested event to @event" do
      event = FactoryGirl.create :event, home_team_id: team.id
      get :show, id: event, team_id: team.id
      expect(assigns(:event)).to eq event
    end

    it "renders the :show template" do

    end

    context "displays the #winner of an event" do
      it "shows #home_team as the winner" do
        # pending "Not implemented properly"
        home_team = FactoryGirl.create :team, name: "Bengals"
        event = FactoryGirl.create :event
        get :show, id: event, team_id: team.id
        expect(response).to render_template(:show)
      end
    end
  end

  describe "GET :edit" do

  end
end
