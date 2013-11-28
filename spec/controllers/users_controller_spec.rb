require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user) }

  describe 'GET #index' do
    it 'assigns @users and returns http success' do
      get :index, id: user.id
      expect(assigns(:users)).to eq [user] and be_success
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns http success and instantiates a @user' do
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
        expect(response).to be_redirect
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).not_to be_success 
      end

      it 'renders the new template' do 
        post :create
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and shows the user data' do
      get :show, id: user.id
      expect(response).to be_success
      expect(user.first_name).to eql "John"
    end

    it 'renders the show template' do
      get :show, id: user.id
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, id: user.id
      expect(response).to be_success
    end

    it 'renders the edit template' do
      get :edit, id: user.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    it 'successfully updates a user resource' do
      get :update, id: user.id
      expect(response).to be_success
    end
  end

  describe 'DELETE #destroy' do
    it 'should redirect to users_path' do
      delete 'destroy', id: user.id
      expect(response).to redirect_to users_path
    end

    it 'deletes a user from the database' do
      delete 'destroy', id: user.id
      expect(User.where(id: user.id)).to be_empty
    end
  end
end
