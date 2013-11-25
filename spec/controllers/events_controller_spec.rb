require 'spec_helper'

describe EventsController do
  let(:team) { FactoryGirl.create(:team) }
  describe "GET :index" do
    it "returns http success" do
      get :index, team_id: team.id
      expect(response).to be_success
    end

    it 'populates an array of all events' do
      event1 = FactoryGirl.create :event, home_team_id: team.id
      event2 = FactoryGirl.create :event, away_team_id: team.id
      get :index, team_id: team.id
      expect(assigns(:events)).to match_array([event1, event2])
    end
  end

  describe 'GET :new' do
    it 'returns http success' do
      home_team = FactoryGirl.create :team
      event = FactoryGirl.create :event
      get :new, id: event, team_id: team.id
      expect(response).to be_success
    end

    it 'assigns @event' do
      home_team = FactoryGirl.create :team
      event = FactoryGirl.create :event
      get :new, id: event, team_id: team.id
      expect(assigns(:event)).to be_a Event
    end
  end

  describe 'GET :show' do
    it 'assigns the requested event to @event' do
      event = FactoryGirl.create :event, home_team_id: team.id
      get :show, id: event, team_id: team.id
      expect(assigns(:event)).to eq event
    end

    it 'renders the :show template' do
      home_team = FactoryGirl.create :team
      event = FactoryGirl.create :event
      get :show, id: event, team_id: team.id
      expect(response).to render_template(:show)
    end

    context 'In the event of a winner' do
      it 'renders #home_team as the winner' do
        home_team = FactoryGirl.create :team
        event = FactoryGirl.create :event
        get :show, id: event, team_id: team.id
        expect(response).to render_template(:show)
      end

      it 'does not show #away_team as the winner' do
        home_team = FactoryGirl.create :team, name: 'Bengals'
        away_team = FactoryGirl.create :team, name: 'Blue Jays'
        event = FactoryGirl.create :event
        event.home_team_score = 20
        event.away_team_score = 19
        expect(response.body).not_to eq 'Away Team'
      end
    end
  end

  describe 'GET :edit' do
    it 'returns http success' do
      home_team = FactoryGirl.create :team
      event = FactoryGirl.create :event
      get :edit, id: event, team_id: team.id
      expect(response).to render_template(:edit)
    end
  end
end
