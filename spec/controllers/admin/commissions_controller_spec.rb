require 'rails_helper'

RSpec.describe Admin::CommissionsController, type: :controller do

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
      commission = FactoryGirl.create(:commission)
      get :show, { id: commission.id }, root_user_session
      expect(response).to have_http_status(:success)
    end

    it "returns http unsuccess by role" do
      commission = FactoryGirl.create(:commission)
      get :show, { id: commission.id }, observer_user_session
      expect(response).to have_http_status(302)
    end       
  end  

  describe "POST #create" do
    it "returns http success" do
      commission = FactoryGirl.create(:commission)
      post :create, {
      								commission: { 
      															 name: commission.name,
          													 commission_topic_id: commission.commission_topic_id,
                                     legislature_id: commission.legislature_id
          												  }
										}, root_user_session
      expect(response).to redirect_to(admin_commission_path(Commission.last))
    end    

    it "returns http unsuccess by role" do
      commission = FactoryGirl.create(:commission)
      post :create, {
                      commission: { 
                                     name: commission.name,
                                     commission_topic_id: commission.commission_topic_id,
                                     legislature_id: commission.legislature_id
                                    }
										}, observer_user_session
      expect(response).to have_http_status(302)
    end        
  end

end  