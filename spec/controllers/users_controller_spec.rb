require 'spec_helper'

describe UsersController do
  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response.status).to eq 200
    end

    it "assigns @users" do
      user = User.create
      get :index
      expect(assigns(:users)).to eq [user]
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "assigns @user" do
      user = User.create
      get :new
      expect(assigns(:user)).to eq @user
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  # describe "GET 'create'" do
  #   it "returns http success" do
  #     get 'create'
  #     response.should be_success
  #   end
  # end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  # describe "GET 'edit'" do
  #   it "returns http success" do
  #     get 'edit'
  #     response.should be_success
  #   end
  # end

  # describe "GET 'update'" do
  #   it "returns http success" do
  #     get 'update'
  #     response.should be_success
  #   end
  # end

  describe "GET 'destroy'" do
    it "returns http success" do
      user = 
      get 'destroy'
      response.should be_success
      user.find
    end
  end
end
