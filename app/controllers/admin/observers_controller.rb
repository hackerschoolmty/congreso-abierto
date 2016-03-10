class Admin::ObserversController < Admin::BaseController
  before_action :set_observer, only: [:activate, :deactivate, :destroy]
  def index
    @observers = User.observers.order(:id).page(params[:page]).per(25)
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
    @observer.status = "active"

    if @observer.save
      flash[:success] = "Observer activated successfully!"
    else
      flash[:danger] =  "Observer could not be activated"
    end

    redirect_to admin_observers_path
  end

  def deactivate
    @observer.status = "inactive"

    if @observer.save
      flash[:success] = "Observer deactivated successfully!"
    else
      flash[:danger] =  "Observer could not be deactivated"
    end

    redirect_to admin_observers_path
  end

  def destroy
    if @observer.destroy
      flash[:success] = "Observer destroyed successfully"
    else
      flash[:warning] = "Observer could'nt be destroyed"
    end

  redirect_to admin_observers_path
  end

  private
  def observer_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_observer
     @observer = User.observers.find(params[:id])
  end

end
