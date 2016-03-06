class CommissionRepresentative < ActiveRecord::Base
  belongs_to :commission
  belongs_to :representative
end
