require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do

  let(:root_user_session) { signin_root }
  let(:observer_user_session) { signin_observer }

  describe "GET #index" do
    
    let(:action) {:index}
    it_behaves_like 'get request under admin namespace'

  end

end
