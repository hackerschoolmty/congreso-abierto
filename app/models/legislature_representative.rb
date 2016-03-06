class LegislatureRepresentative < ActiveRecord::Base
  belongs_to :district
  belongs_to :party
  belongs_to :seat

  belongs_to :representative
  belongs_to :legislature

  enum status: [:inactive, :active]
end
