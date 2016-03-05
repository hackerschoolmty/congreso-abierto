class Admin::BaseController < ApplicationController
  before_action :authenticate_user!, :root_user_mandatory!

  def root_user_mandatory!
    unless current_user.root?
      sign_out_all_scopes
      redirect_to root_path and return
    end
  end
end
