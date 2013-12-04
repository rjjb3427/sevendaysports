require 'spec_helper'

describe TeamsController do
  let(:team) { FactoryGirl.create(:team) }
  describe 'GET #index' do
    it 'returns http success and assigns every team object into an @teams array' do
      get :index, university_id: team.university_id
      expect(assigns(:teams)).to eq [team] and be_success
    end

    it 'renders the index template' do
      get :index, university_id: team.university_id
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns http success and instantiates a @team' do
      get :new, university_id: team.university_id, id: team.id
      expect(team).to be_a_kind_of Team
    end

    it 'renders the #new template' do
      get :new, university_id: team.university_id
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #create' do
    context 'given valid credentials' do
      it 'returns http success and redirects to the #show template' do
        post :create, team: FactoryGirl.attributes_for(:team), 
        university_id: team.university_id
        team = Team.order(:created_at).last
        expect(response).to be_redirect
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        post :create, team: FactoryGirl.attributes_for(:team), 
        university_id: team.university_id
        team = Team.order(:created_at).last
        expect(response).not_to be_success
      end

      it 'should render the #new template' do
        post :create, university_id: team.university_id
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the #show template' do
      get :show, university_id: team.university_id, id: team.id
      expect(response).to be_success
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the #edit template' do
      get :edit, university_id: team.university_id, id: team.id
      expect(response).to be_success
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET #update' do
    it 'returns http success and redirects to the #show template' do
      get :update, university_id: team.university_id, id: team.id
      expect(response).to be_redirect
      expect(response).to redirect_to :university_team
    end
  end

  describe 'DELETE #destroy' do
    it 'should destroy object from the database and redirect to teams_path' do
      delete :destroy, university_id: team.university_id, id: team.id
      expect(team.delete).to be_true
      expect(response).to redirect_to :university_teams
    end
  end
end
