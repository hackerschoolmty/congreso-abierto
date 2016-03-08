require 'rails_helper'

RSpec.describe LegislaturesController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for(:legislature) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      legilature = FactoryGirl.create(:legislature)
      get :show, { id: legilature.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, { legislature: valid_attributes }
      expect(response).to redirect_to(Legislature.last)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      legilature = FactoryGirl.create(:legislature)
      get :edit, { id: legilature.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      legilature = FactoryGirl.create(:legislature)
      put :update, { id: legilature.id, legislature: {name: 'XVIII'}}
      expect(response).to redirect_to(legilature)
    end
  end

  # describe "DELETE #destroy" do
  #   it "returns http success" do
  #     legilature = FactoryGirl.create(:legislature)
  #     delete :destroy, { id: legilature.id }
  #     expect(response).to redirect_to(legislatures_path)
  #   end
  # end

end
