class LegislatureRepresentative < ActiveRecord::Base	
	belongs_to 	:district
	belongs_to 	:party
	belongs_to	:seat

	enum status: [:inactive, :active]
end
