class Admin::CommissionTopicsController < Admin::BaseController	
	before_action :authenticate_user!, only: [:create]
	before_action :set_commission_topic, only: [:show]

	def index
		@commission_topics = CommissionTopic.all
	end

	def new
		@commission_topic = CommissionTopic.new
	end

	def show
	end

	def create
		@commission_topic = CommissionTopic.new(comission_topics_params)

    respond_to do |format|
      if @commission_topic.save
        format.html { redirect_to admin_commission_topic_path(@commission_topic) }
      else
        format.html { render :new }
      end
    end  
	end

	private

	def set_commission_topic
		@commission_topic = CommissionTopic.find(params[:id])
	end

	def comission_topics_params
		params.require(:commission_topic).permit(:name, :description)
	end

end