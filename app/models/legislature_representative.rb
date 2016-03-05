class LegislatureRepresentative < ActiveRecord::Base
	
	enum status: [ :active, :innactive ]
end
