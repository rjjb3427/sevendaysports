require 'spec_helper'

describe TeamsController do
  describe 'GET #index' do
    before(:each) { @university = FactoryGirl.create(:university) }
    before(:each) { @teams = @university.teams }
    it 'returns http success' do
      get :index, university_id: @teams.university_id
      expect(response).to be_success
    end

    it 'assigns every team object into an @teams array' do
      @teams = @university.teams
      get :index, university_id: @teams.university_id
      expect(assigns(:teams)).to eq [@team] and be_success
    end

    it 'renders the index template' do
      @university = FactoryGirl.create :university
      get :index, university_id: @team.university_id
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    before(:each) { @university = FactoryGirl.create(:university) }
    it 'returns http success and instantiates a @team' do
      @university = FactoryGirl.create :university
      @team = FactoryGirl.create :team
      get :new, university_id: @team.university_id, id: @team.id
      expect(@team).to be_a_kind_of Team
    end

    it 'renders the #new template' do
      @university = FactoryGirl.create :university
      get :new, university_id: @team.university_id
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #create' do
    context 'given valid credentials' do
      before(:each) { @university = FactoryGirl.create(:university) }

      it 'returns http success and redirects to the #show template' do
        @university = FactoryGirl.create :university
        post :create, team: FactoryGirl.attributes_for(:team), 
        university_id: @team.university_id
        team = Team.order(:created_at).last
        expect(response).to be_redirect
      end
    end

    context 'given invalid credentials' do
      before(:each) { @university = FactoryGirl.create(:university) }

      it 'returns http client error' do
        post :create, team: FactoryGirl.attributes_for(:team), 
        university_id: @team.university_id
        team = Team.order(:created_at).last
        expect(response).not_to be_success
      end

      it 'should render the #new template' do
        post :create, university_id: @team.university_id
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    before(:each) { @university = FactoryGirl.create(:university) }

    it 'returns http success and renders the #show template' do
      @team = FactoryGirl.create :team
      get :show, university_id: @team.university_id, id: @team.id
      expect(response).to be_success
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    before(:each) { @university = FactoryGirl.create(:university) }

    it 'returns http success and renders the #edit template' do
      @team = FactoryGirl.create :team
      get :edit, university_id: @team.university_id, id: @team.id
      expect(response).to be_success
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET #update' do
    before(:each) { @university = FactoryGirl.create(:university) }
    it 'returns http success and redirects to the #show template' do
      @team = FactoryGirl.create :team
      get :update, university_id: @team.university_id, id: @team.id
      expect(response).to eql 200
      expect(response).to be_redirect
    end
  end

  describe 'DELETE #destroy' do
    it 'should destroy object from the database and redirect to teams_path' do
      delete :destroy, university_id: @team.university_id, id: @team.id
      expect(@university.delete).to be_true
      expect(response).to redirect_to universities_path
    end
  end
end
