class Admin::ObserversController < Admin::BaseController

  def index

  end

  def new
    @observer = User.new
  end

  def create
    @observer = User.new(observer_params)
    @observer.role = "observer"

    if @observer.save
      flash[:success] = "Observer created successfully!"
      redirect_to admin_observers_path
    else

      render :new
    end

  end

  private
  def observer_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
