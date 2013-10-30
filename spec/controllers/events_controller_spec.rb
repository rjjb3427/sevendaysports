require 'spec_helper'

describe EventsController do
  describe "GET :index" do
    it "populates an array of all events" do
      event1 = FactoryGirl.create :event
      event2 = FactoryGirl.create :event
      get :index
      expect(assigns(:contacts)).to match_array([event1, event2])
    end
  end

  describe "GET :new" do
  
  end

  describe "GET :show" do
    it "assigns the requested event to @event" do
      event = FactoryGirl.create :event
      get :show, id: event
      expect(assigns(:event)).to eq event
    end

    it "renders the :show template" do

    end

    context "displays the #winner of an event" do
      it "shows #home_team as the winner" do
        pending "Not implemented properly"
        home_team = FactoryGirl.create :team, name: "Bengals"
        event = FactoryGirl.create :event
        get :show, id: event
        expect(response).to render_template(:show)
      end
    end
  end

  describe "GET :edit" do

  end
end
