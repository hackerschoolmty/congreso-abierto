class LegislaturesController < ApplicationController
  before_action :set_legislature

  def index
    @legislatures = Legislature.All
  end

  def show

  end

  def new
    @legislature = Legislature.new
  end

  def create
    @legislature = Legislature.new(legislature_params)

    respond_to do |format|
      if @legislature.save
        format.html { redirect_to legislature_path(@legislature) }
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
        format.html { redirect_to @legislature, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end    
  end

  def destroy
    @legislature.destroy
    respond_to do |format|
      format.html { redirect_to legislature_comments_url(@legislature), notice: 'Comment was successfully destroyed.' }
      format.js {}
    end    
  end

  private

  def set_legislature
    @legislature = Legislature.find(params[:id])
  end

  def params_legislature
    params.require(:legislature).permit(:name, :status, :starts_on, :ends_on)
  end
end
