class LegislatureRepresentative < ActiveRecord::Base	
	belongs_to :district
	belongs_to :party

	enum status: [:inactive, :active]
end
