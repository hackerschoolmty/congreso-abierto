class Admin::CommissionsController < Admin::BaseController	
	before_action :authenticate_user!, only: [:create]
	before_action :set_commission, only: [:show]

	def index
		@commissions = Commission.all
	end

	def new
		@commission = Commission.new
		@legislatures = Legislature.all
		@commission_topics = CommissionTopic.all
	end

	def show
	end

	def create
		@commission = Commission.new(commission_params)

    respond_to do |format|
      if @commission.save
        format.html { redirect_to admin_commission_path(@commission) }
      else
        format.html { render :new }
      end
    end  
	end

	private

	def set_commission
		@commission = Commission.find(params[:id])
	end

	def commission_params
		params.require(:commission).permit(:name, :legislature_id, :commission_topic_id)
	end
end