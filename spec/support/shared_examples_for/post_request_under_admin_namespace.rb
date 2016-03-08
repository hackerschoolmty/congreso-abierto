shared_examples_for 'post request under admin namespace' do 

    it "redirects if user role is different than root" do
      post action, {}, observer_user_session
      expect(response.status).to eq(302)
    end

end