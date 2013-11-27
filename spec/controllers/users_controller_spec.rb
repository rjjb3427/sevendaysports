require 'spec_helper'

describe UsersController do
  before(:each) { @user = FactoryGirl.create :user }

  describe 'GET #index' do
    it 'assigns @users' do
      get :index
      expect(assigns(:users)).to eq [@user] and be_success
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns http success and instantiates a @user' do
      user = FactoryGirl.create :user
      get :new
      expect(response).to be_success
      expect(assigns(:user)).to be_a_kind_of User 
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'given valid credentials' do
      it 'redirects to the #show template' do
        post :create, user: FactoryGirl.attributes_for(:user)
        user = User.order(:created_at).last
        expect(response).to be_redirect
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        post :create, user: FactoryGirl.attributes_for(:user)
        user = User.order(:created_at).last
        expect(response).not_to be_success 
      end

      it 'should render the new template' do 
        post :create
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and shows @user data' do
      get :show, id: @user
      expect(response).to be_success
      expect(@user.first_name).to eql "John"
    end

    it 'renders the show template' do
      get :show, id: @user
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, id: @user
      expect(response).to be_success
    end

    it 'renders the edit template' do
      get :edit, id: @user
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    it 'successfully updates @user resource' do
      get :update, id: @user
      expect(response).to redirect_to @user
    end
  end

  describe 'DELETE #destroy' do
    it 'should redirect to users_path' do
      delete 'destroy', id: @user
      expect(response).to redirect_to users_path
    end

    it 'deletes a user from the database' do
      delete 'destroy', id: @user
      expect(User.where(id: @user.id)).to be_empty
    end
  end
end
