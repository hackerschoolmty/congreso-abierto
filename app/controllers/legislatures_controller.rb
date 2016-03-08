class LegislaturesController < ApplicationController
  
  before_action :set_legislature, only: [:edit, :update, :show]

  def index
    @legislatures = Legislature.all
  end

  def new
    @legislature = Legislature.new
  end

  def show
    
  end

  def create
    @legislature = Legislature.new(legislature_params)

    respond_to do |format|
      if @legislature.save
        format.html { redirect_to legislatures_path(@legislature) }
      else
        format.html { render :new }
      end
    end    
  end

  def edit
  end

  def update
    respond_to do |format|
      if @legislature.update(legislature_params)
        format.html { redirect_to legislatures_path(@legislature), notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end    
  end

  private

  def set_legislature
    @legislature = Legislature.find(params[:id])
  end

  def legislature_params
    params.require(:legislature).permit(:name, :status, :starts_on, :ends_on)
  end
end