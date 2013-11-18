require 'spec_helper'

describe TeamsController do
  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    # it "assigns every team object into an @teams array" do
    #   # team1 = FactoryGirl.create(:team) 
    #   # team2 = FactoryGirl.create(:team) 
    #   get :index
    #   expect(assigns(:teams)).to eq [@team]
    # end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end

    it "assings @team" do
      get :new
      expect(assigns(:team)).to be_a Team
    end

    it "renders the 'new' template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET 'create'" do
    context "given valid credentials" do
      it "returns http success" do
        post :create, team: FactoryGirl.attributes_for(:team)
        team = Team.order(:created_at).last
        expect(response).to be_redirect
      end
    end

    context "given invalid credentials" do
      it "returns http client error" do
        post :create, team: FactoryGirl.attributes_for(:team)
        team = Team.order(:created_at).last
        expect(response).not_to be_success
      end

      it "should render the 'new' template" do
        post :create
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      team = FactoryGirl.create :team, name: "team_name", sport_type: "type of sport"
      get :show, id: team
      expect(response).to be_success
    end

    it "renders the 'show' template" do
      team = FactoryGirl.create :team, name: "team_name", sport_type: "type of sport"
      get :show, id: team
      expect(response).to render_template(:show)
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      team = FactoryGirl.create :team, name: "Bengals", sport_type: "Baseball"
      get :edit, id: team.id
      expect(response).to be_success
    end

    it "renders the 'edit' template" do
      team = FactoryGirl.create :team, name: "Bengals", sport_type: "Baseball"
      get :edit, id: team.id
      expect(response).to render_template(:edit)
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      team = FactoryGirl.create :team, name: "Bengals", sport_type: "Baseball"
      get :update, id: team.id
      expect(response.status).to eql 302
    end
  end

  # describe "GET 'destroy'" do
  #   it "returns http success" do
  #     get 'destroy'
  #     expect(response).to be_success
  #   end
  # end
end
