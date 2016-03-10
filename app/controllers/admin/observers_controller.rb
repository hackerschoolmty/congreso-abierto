class Admin::ObserversController < Admin::BaseController

  def index
    @observers = User.observers.page(params[:page]).per(25)
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

  def activate
    @observer = User.observers.find(params[:id])
    @observer.status = "active"

    if @observer.save
      flash[:success] = "Observer activated successfully!"
    else
      flash[:danger] =  "Observer could not be activated"
    end

    redirect_to admin_observers_path
  end

  private
  def observer_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
