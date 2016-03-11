require 'rails_helper'

RSpec.describe Admin::CommissionTopicsController, type: :controller do

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
      commission_topic = FactoryGirl.create(:commission_topic)
      get :show, { id: commission_topic.id }, root_user_session
      expect(response).to have_http_status(:success)
    end

    it "returns http unsuccess by role" do
      commission_topic = FactoryGirl.create(:commission_topic)
      get :show, { id: commission_topic.id }, observer_user_session
      expect(response).to have_http_status(302)
    end       
  end  

  describe "POST #create" do
    it "returns http success" do
      commission_topic = FactoryGirl.create(:commission_topic)
      post :create, {
      								commission_topic: { 
      																		name: commission_topic.name,
          																description: commission_topic.description
          															}
										}, root_user_session
      expect(response).to redirect_to(admin_commission_topic_path(CommissionTopics.last))
    end    

    it "returns http unsuccess by role" do
      commission_topic = FactoryGirl.create(:commission_topic)
      post :create, {
      								commission_topic: { 
      																		name: commission_topic.name,
          																description: commission_topic.description
          															}
										}, observer_user_session
      expect(response).to have_http_status(302)
    end        
  end

end  