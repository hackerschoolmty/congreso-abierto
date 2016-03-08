shared_examples_for 'get request under admin namespace' do 

   it "returns http success if user role is root" do
      get action, {}, root_user_session
      expect(response).to have_http_status(:success)
    end

    it "redirects if user role is different than root" do
      get action, {}, observer_user_session
      expect(response.status).to eq(302)
    end

end