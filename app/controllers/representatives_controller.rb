class RepresentativesController < ApplicationController

	before_action :authenticate_user!, only: [:create] 

	def index
		@representatives = Representative.all
	end

	def create
		@representative = Representative.new(representative_params)
		if @representative.save
			@representative
		end
	end

	private
		
	def representative_params
		params.require(:representative).permit(:first_name,:last_name, :email, :phone, :represetative_type, :twitter,:facebook)
	end
	
end
