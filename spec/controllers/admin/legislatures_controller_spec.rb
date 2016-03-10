require 'rails_helper'

RSpec.describe Admin::LegislaturesController, type: :controller do

  let(:root_user_session) { signin_root }
  let(:observer_user_session) { signin_observer }

	describe "GET #index" do

    it "returns http success" do
      get :index, {},  root_user_session
      expect(response).to have_http_status(:success)
    end

    it "returns http unsuccess by role" do
      get :index, {},  observer_user_session
      expect(response).to have_http_status(302)
    end    
  end

  describe "GET #new" do

    it "returns http success" do
      get :new, {},  root_user_session
      expect(response).to have_http_status(:success)
    end

    it "returns http unsuccess by role" do
      get :new, {},  observer_user_session
      expect(response).to have_http_status(302)
    end    
  end

  describe "GET #show" do
    it "returns http success" do      
      legislature = FactoryGirl.create(:legislature)
      get :show, { id: legislature.id }, root_user_session
      expect(response).to have_http_status(:success)
    end

    it "returns http unsuccess by role" do
      legislature = FactoryGirl.create(:legislature)
      get :show, { id: legislature.id }, observer_user_session
      expect(response).to have_http_status(302)
    end       
  end

  describe "GET #edit" do
    it "returns http success" do      
      legislature = FactoryGirl.create(:legislature)
      get :edit, { id: legislature.id }, root_user_session
      expect(response).to have_http_status(:success)
    end

    it "returns http unsuccess by role" do
      legislature = FactoryGirl.create(:legislature)
      get :edit, { id: legislature.id }, observer_user_session
      expect(response).to have_http_status(302)
    end       
  end

  describe "POST #create" do
    it "returns http success" do
      legislature = FactoryGirl.create(:legislature)
      post :create, {legislature: { name: legislature.name,
                      status: "inactive",
                      starts_on: legislature.starts_on,
                      ends_on: legislature.ends_on}}, root_user_session
      expect(response).to redirect_to(admin_legislatures_path(Legislature.last))
    end    

    it "returns http unsuccess by data" do
      legislature = FactoryGirl.create(:legislature)
      post :create, {legislature: 
                      {     name: legislature.name,
                       starts_on: legislature.starts_on,
                         ends_on: legislature.ends_on
                      }
                    }, root_user_session
      expect(response).to have_http_status(302)
    end    

    it "returns http unsuccess by role" do
      legislature = FactoryGirl.create(:legislature)
      post :create, {legislature: { name: legislature.name,
                      status: "inactive",
                      starts_on: legislature.starts_on,
                      ends_on: legislature.ends_on}}, observer_user_session
      expect(response).to have_http_status(302)
    end        
  end

  describe "PUT #update" do
    it "returns http success" do
      legislature = FactoryGirl.create(:legislature)
      put :update, { id: legislature.id, legislature: {name: 'XVIII'}}, root_user_session
      expect(response).to redirect_to(admin_legislatures_path(legislature))
    end

   it "returns http unsuccess by role" do
      legislature = FactoryGirl.create(:legislature)
      put :update, { id: legislature.id, legislature: {name: 'XVIII'}}, observer_user_session
      expect(response).to have_http_status(302)
    end
  end
end	