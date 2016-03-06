class Commission < ActiveRecord::Base
  belongs_to :commission_topic
  belongs_to :legislature
end
