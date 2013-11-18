require 'spec_helper'

describe UniversitiesController do
  before(:each) { @university = FactoryGirl.create :university }

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it "assigns @universities" do
      get :index
      expect(assigns(:universities)).to eq [@university] 
      # spec breaks when more than one entry in db
    end

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

    it "assigns @university" do
      get :new
      expect(assigns(:university)).to be_a University
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST 'create'" do
    context "given valid credentials" do
      it "returns http success" do
        post :create, university: FactoryGirl.attributes_for(:university)
        university = University.order(:created_at).last
        expect(response).to redirect_to university
      end

      it "should redirect to the show path" do
        post :create, university: FactoryGirl.attributes_for(:university)
        university = University.order(:created_at).last
        expect(response).to redirect_to university
      end
    end

    context "given invalid credentials" do
      it "returns http client error" do
        post :create, university: FactoryGirl.attributes_for(:university)
        university = University.order(:created_at).last
        expect(response).not_to be_success
      end

      it "should render the new template" do
        post :create
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get :show, id: @university
      expect(response).to be_success
    end

    it "renders the show template" do
      get :show, id: @university
      expect(response).to render_template(:show)
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get :edit, id: @university
      expect(response).to be_success
    end

    it "renders the edit template" do
      get :edit, id: @university
      expect(response).to render_template(:edit)
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get :update, id: @university
      expect(response.status).to eq 302 
    end

    it "should redirect to show template" do
      get :update, id: @university
      expect(response).to redirect_to @university
    end
  end

  describe "DELETE 'destroy'" do
    it "should redirect to universities_path" do
      delete :destroy, id: @university
      expect(response).to redirect_to universities_path
    end
  end
end
