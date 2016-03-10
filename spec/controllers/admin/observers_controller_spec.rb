require 'rails_helper'

RSpec.describe Admin::ObserversController, type: :controller do

  let(:root_user_session) { signin_root }
  let(:observer_user_session) { signin_observer }

  describe "GET #index" do 

    let(:action) {:index}
    it_behaves_like 'get request under admin namespace'

    it "renders index template" do 
      get :index, {}, root_user_session
      expect(response).to render_template(:index)
    end

    context "with page parameter" do 
      it "assigns 25 observers per page to instance" do 
        
        50.times { FactoryGirl.create(:observer_user) }
        get :index, {page: 1}, root_user_session
        expect(assigns(:observers).count).to eq( 25 )

      end

      it "assigns different observers per page to instance" do 

        50.times { FactoryGirl.create(:observer_user) }

        observers = User.observers.order(:id).page(1).per(25)
        get :index, {page: 1}, root_user_session
        expect(assigns(:observers)).to eq( observers )

        observers = User.observers.order(:id).page(2).per(25)
        get :index, {page: 2}, root_user_session
        expect(assigns(:observers)).to eq( observers )

      end
    end

  end

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

  describe "PUT #activate" do 

    let(:action) {:activate}
    let(:inactive_observer) {FactoryGirl.create(:inactive_observer_user)}
    let(:action_params) { {id: inactive_observer.id} }

    context "when user is different than root" do 

      it "redirects" do
        put :activate, action_params, observer_user_session
        expect(response.status).to eq(302)
      end

    end

    context "when user is root" do 

      it "changes observer status to active" do 
        put :activate, action_params, signin_root

        inactive_observer.reload
        expect(inactive_observer.status).to eq("active")

      end

      it "redirects to observers index" do 
        put :activate, action_params, signin_root

        expect(response).to redirect_to(admin_observers_path)
      end

    end

  end

  describe "PUT #deactivate" do 

    let(:action) {:deactivate}
    let(:active_observer) {FactoryGirl.create(:active_observer_user)}
    let(:action_params) { {id: active_observer.id} }

    context "when user is different than root" do 

      it "redirects" do
        put :deactivate, action_params, observer_user_session
        expect(response.status).to eq(302)
      end

    end

    context "when user is root" do 

      it "changes observer status to active" do 
        put :deactivate, action_params, signin_root

        active_observer.reload
        expect(active_observer.status).to eq("inactive")

      end

      it "redirects to observers index" do 
        put :deactivate, action_params, signin_root

        expect(response).to redirect_to(admin_observers_path)
      end

    end

  end

  describe "DELETE #destroy" do 

    let!(:observer) {FactoryGirl.create(:observer_user)}
    let(:action_params) { {id: observer.id} }

    context "when user is different than root" do 

      it "redirects" do
        delete :destroy, action_params, observer_user_session
        expect(response.status).to eq(302)
      end

    end

    context "when user is root" do 

      it "changes observer count by -1" do

        expect { delete :destroy, action_params, signin_root  }.to change(User.observers, :count).by(-1)
      end

      it "redirects to observers index" do 
        delete :destroy, action_params, signin_root

        expect(response).to redirect_to(admin_observers_path)
      end

    end

  end
end
