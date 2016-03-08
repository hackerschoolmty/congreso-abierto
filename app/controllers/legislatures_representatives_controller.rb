class LegislaturesRepresentativesController < ApplicationController
	before_action :authenticate_user!, only: [:create] 

	def new
		@legislatures = Legislature.where(status: 1 )
		@representatives = Representative.all
		@seats = Seat.all
		@partys = Party.all
		@districts = District.all
	end

	def create
		@legislature_representative = LegislatureRepresentative.new(legislature_representative_params)
		if @legislature_representative.save
			@legislature_representative
		end
	end

	private
	def legislature_representative_params
		params.require(:legislature_representative).permit(:legislature_id, :representative_id, :seat_id, :party_id, :district_id)
	end

end
