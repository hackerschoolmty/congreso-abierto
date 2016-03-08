require 'rails_helper'

RSpec.describe Admin::ObserversController, type: :controller do

  let(:root_user_session) { signin_root }
  let(:observer_user_session) { signin_observer }

  describe "GET #new" do

    let(:action) {:new}
    it_behaves_like 'get request under admin namespace'

    it "renders new template" do 
      get :new, {}, root_user_session
      expect(response).to render_template(:new)
    end
  
  end

  describe "POST #create" do 

    let(:action) {:create}
    it_behaves_like 'post request under admin namespace'

    context "when user is root" do 

      let (:observer_params) { FactoryGirl.attributes_for(:observer_user) }
      
      it "creates a new observer" do
        expect {  post :create, {user: observer_params}, signin_root  }.to change(User.observers, :count).by(1) 
      end

      it "redirects to index if observer created successfully" do 
        post :create, {user: observer_params}, signin_root
        expect(response).to redirect_to(admin_observers_path)
      end

      it "render new template if observer has error" do
        observer_params_with_errors = FactoryGirl.attributes_for(:observer_user, email: "")
        post :create, {user: observer_params_with_errors}, signin_root
        expect(response).to render_template(:new)
      end

    end
    
  end

end
