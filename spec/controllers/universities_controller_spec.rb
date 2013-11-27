require 'spec_helper'

describe UniversitiesController do
  before(:each) { @university = FactoryGirl.create :university }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end

    it 'returns http success and instantiates @universities' do
      get :index
      expect(response).to be_success
      expect(assigns(:universities)).to eq [@university]
      expect(@university).to be_a_kind_of University 
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'assigns @university' do
      get :new
      expect(response).to be_success
      expect(assigns(:university)).to be_a University
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'given valid credentials' do
      it 'returns http success and redirects to the #show template' do
        post :create, university: FactoryGirl.attributes_for(:university)
        university = University.order(:created_at).last
        expect(response).to be_redirect
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error and renders #new template' do
        post :create, university: FactoryGirl.attributes_for(:university)
        university = University.order(:created_at).last
        expect(response).not_to be_success
      end

      it 'should render the new template' do
        post :create
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the #show template' do
      get :show, id: @university
      expect(response).to be_success
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the edit template' do
      get :edit, id: @university
      expect(response).to be_success
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    it 'returns http success and redirects to the #show template' do
      get :update, id: @university
      expect(response.status).to eq 302 
      expect(response).to redirect_to @university
    end
  end

  describe 'DELETE #destroy' do
    it 'should destroy object from the database and redirect to universities_path' do
      delete :destroy, id: @university
      expect(@university.delete).to be_true
      expect(response).to redirect_to universities_path
    end
  end
end
