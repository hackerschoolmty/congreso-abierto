require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do

  let(:root_user_session) { signin_root }
  let(:observer_user_session) { signin_observer }

  describe "GET #index" do
    it "returns http success if user role is root" do
      get :index, {}, root_user_session
      expect(response).to have_http_status(:success)
    end

    it "redirects if user role is different than root" do
      get :index, {}, observer_user_session
      expect(response.status).to eq(302)
    end
  end

end
